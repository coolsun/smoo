class Util::LocationPropertySetter
  attr_reader :location, :data_client, :daily_power

  def initialize
    @data_client ||= InfluxDB::Client.new(url: Rails.configuration.x.influxdb.url, epoch: 's')
  end

  def set(location, properties=[])
    @location    = location
    @daily_power = nil # 因為有cache，所以要清除

    properties.each {|p| location.send("#{p.to_s}=", send("set_#{p.to_s}"))}
  end

  def set_daily_power
    if daily_power
      daily_power
    else
      data = data_client.query("SELECT LAST(\"E-Day\") from power WHERE location_id = #{location.id}")
      @daily_power = data.empty? ? nil : data[0]["values"][0]["last"]
    end
  end

  def set_total_power
    data = data_client.query("SELECT LAST(\"E-Total\") from power WHERE location_id = #{location.id}")
    data.empty? ? nil : data[0]["values"][0]["last"] + daily_power
  end

  # TODO: 讀取真實數據
  def set_pr_percentage
    rand(1..100)
  end

  # TODO: 與set_temperature整合
  def set_wx
    motc_data = Rails.configuration.x.motc

    begin
      data = RestClient.get(motc_data.url, headers:{accept: 'application/json'}, params: {
        Authorization: motc_data.auth,
        locationName: location.city,
        elementName: 'Wx',
        sort: 'time'
      })

      json_data = JSON.parse(data.body, symbolize_names: true)
      json_data[:records][:location].empty? ?
      nil :
      json_data[:records][:location][0][:weatherElement][0][:time][0][:parameter][:parameterName]
    rescue => e
      Rails.logger.info("#{e.message} #{e.backtrace[0..10]}")
      nil
    end
  end

  def set_temperature
    motc_data = Rails.configuration.x.motc

    begin
      data = RestClient.get(motc_data.url, headers:{accept: 'application/json'}, params: {
        Authorization: motc_data.auth,
        locationName: location.city,
        elementName: 'MaxT',
        sort: 'time'
      })

      json_data = JSON.parse(data.body, symbolize_names: true)
      
      json_data[:records][:location].empty? ?
      nil :
      json_data[:records][:location][0][:weatherElement][0][:time][0][:parameter][:parameterName].to_i
    rescue => e
      Rails.logger.info("#{e.message} #{e.backtrace[0..10]}")
      nil
    end
  end

end