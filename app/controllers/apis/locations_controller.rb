class Apis::LocationsController < ApisController
  def index
    authorize Location
    
    @locations            = Location.all
    client                = get_influx_client
    daily_power           = client.query("SELECT LAST(\"E-Day\") from power")[0]["values"][0]["last"]
    total_power           = client.query("SELECT LAST(\"E-Total\") from power")[0]["values"][0]["last"]
    total_voltage         = client.query("SELECT SUM(Ua)+SUM(Ub)+SUM(Uc) from power")[0]["values"][0]["sum_sum_sum"]
    total_current         = client.query("SELECT SUM(Ia)+SUM(Ib)+SUM(Ic) from power")[0]["values"][0]["sum_sum_sum"]
    instant_power_1       = client.query("SELECT SUM(a) FROM (SELECT Ua * Ia As a from power)")[0]["values"][0]["sum"]
    instant_power_2       = client.query("SELECT SUM(b) FROM (SELECT Ub * Ib As b from power)")[0]["values"][0]["sum"]
    instant_power_3       = client.query("SELECT SUM(c) FROM (SELECT Uc * Ic As c from power)")[0]["values"][0]["sum"]
    discharge_coefficient = GlobalConfig.get_config('discharge_coefficient')[:value]
    average_sunshine_index= daily_power


    @locations.each do |l|
      l.formate_time           = l.updated_at.strftime("%Y-%m-%d %H:%M:%S")
      l.daily_power            = daily_power
      l.total_power            = total_power + daily_power
      l.total_voltage          = total_voltage
      l.total_current          = total_current
      l.sale_electricity_price = (l.total_power * l.default_rate.to_f).round(2)
      l.instant_power          = Util::Converter.to_float(instant_power_1 + instant_power_2 + instant_power_3)
      l.total_device           = Util::Converter.to_float(l.total_device)
      l.goal_pr                = Util::Converter.to_float(l.goal_pr)
      l.now_pr                 = "80"
      l.average_sunshine_index = Util::Converter.to_float(daily_power/l.total_device)

      co2_reduction           = (total_power/discharge_coefficient.to_f).round(2)
      l.co2_reduction          = co2_reduction.infinite? ? 0.0 : co2_reduction 

      #l.sale_electricity_price =  Util::Converter.to_float(l.sale_electricity_price) 
      # l.sale_electricity_price = sale_electricity_price.infinite? ? 0.0 : sale_electricity_price 
    end
  end
  
  def graphs
    authorize Location

    locations    = Location.all
    current_time = Time.now.utc
    bound_time   = current_time.beginning_of_day + 1.days
    start_time   = current_time.beginning_of_month # 還沒到達的時間value應調整為nil，方便前端判斷
    end_time     = start_time + 1.month

    @data = locations.map{|l| {id: l.id,name:  l.name}}
    @data.each {|d| d[:graph] = get_graph(d[:id], start_time, end_time, bound_time: bound_time)}
  end

  # TODO: 與graphs整合
  def graph
    authorize Location

    location     = Location.find(params[:id])
    current_time = Time.now.utc
    bound_time   = current_time.beginning_of_hour + 1.hours
    start_time   = current_time.beginning_of_day # 還沒到達的時間value應調整為nil，方便前端判斷
    end_time     = start_time + 1.days

    #@data = {name: location.name, graph: get_graph(location.id, start_time, end_time, bound_time: bound_time)}
    @data = {name: location.name}
  end

  def create
    authorize Location

    @location = Location.new(location_params)
    begin
      Location.transaction do
        @location.save!
        @location.update!(code: "L#{@location.id.to_s.rjust(2, '0')}")
      end

      render json: {message: 'ok'}
    rescue => e
      render_error(@location)
      Rails.logger.info(e.message)
    end
	end

  def edit
    authorize Location

    @location = Location.find(params[:id])
    client                = get_influx_client
    daily_power           = client.query("SELECT LAST(\"E-Day\") from power")[0]["values"][0]["last"]
    total_power           = client.query("SELECT LAST(\"E-Total\") from power")[0]["values"][0]["last"]
    total_voltage         = client.query("SELECT SUM(Ua)+SUM(Ub)+SUM(Uc) from power")[0]["values"][0]["sum_sum_sum"]
    total_current         = client.query("SELECT SUM(Ia)+SUM(Ib)+SUM(Ic) from power")[0]["values"][0]["sum_sum_sum"]
    instant_power_1       = client.query("SELECT SUM(a) FROM (SELECT Ua * Ia As a from power)")[0]["values"][0]["sum"]
    instant_power_2       = client.query("SELECT SUM(b) FROM (SELECT Ub * Ib As b from power)")[0]["values"][0]["sum"]
    instant_power_3       = client.query("SELECT SUM(c) FROM (SELECT Uc * Ic As c from power)")[0]["values"][0]["sum"]
    discharge_coefficient = GlobalConfig.get_config('discharge_coefficient')[:value]
    average_sunshine_index= daily_power

    @location.formate_time           = @location.updated_at.strftime("%Y-%m-%d %H:%M:%S")
    @location.daily_power            = daily_power
    @location.total_power            = total_power + daily_power
    @location.total_voltage          = total_voltage
    @location.total_current          = total_current
    @location.sale_electricity_price = (@location.total_power * @location.default_rate.to_f).round(2)
    @location.instant_power          = Util::Converter.to_float(instant_power_1 + instant_power_2 + instant_power_3)
    @location.total_device           = Util::Converter.to_float(@location.total_device)
    @location.goal_pr                = Util::Converter.to_float(@location.goal_pr)
    @location.average_sunshine_index = Util::Converter.to_float(daily_power/@location.total_device)
    @location.now_pr                 = "80"

    co2_reduction           = (total_power/discharge_coefficient.to_f).round(2)
    @location.co2_reduction          = co2_reduction.infinite? ? 0.0 : co2_reduction 

	end

  def update
    authorize Location

    @location = Location.find(params[:id])
    @fields = params[:fields].to_s.split(",").map(&:to_sym)

    if @location.update(location_params)
      @fields.empty? ? render(json: {message: 'ok'}) : render(:fields) #選取欄位功能待整合
    else
      render_error(@location)
    end
	end

  def destroy
    authorize Location

    @location = Location.find(params[:id])

    if @location.destroy
      render json: {message: 'ok'}
    else
      render_error(@location)
    end
  end

  def disable_enable_location

    @location = Location.find(params[:id])

    if @location.update(disable_parms)
      render(json: {message: 'ok'})
    else
      render_error(@location)
    end

  end

  def device_props
    l = Location.find(params[:id])

    m_group = l.devices.includes(
      device_model:                  [:raw_properties, :device_type],
      normalization_property_values: [:normalization_property]
    ).group_by(&:device_model)

    @data = []
    m_group.each do |model, devices|
      # 產生devices的nor_props
      devices_nor_props = {}
      devices.each do |d|
        devices_nor_props[d.id] = {}

        d.normalization_property_values.each do |v_wrapper|
          devices_nor_props[d.id][v_wrapper.normalization_property.name] = v_wrapper.value
        end
      end

      @data << {
        model_name: model.name,
        type_name:  model.device_type.try(:name),
        gain:       model.raw_properties.map(&:gain),
        quantity:   model.raw_properties.map(&:quantity),
        raw_props:  model.raw_properties.map(&:name),
        nor_props:  devices_nor_props
      }
    end
  end

  def mppts
    authorize Location
    @location = Location.find(params[:id])
    @mppt_devices = Device.where(location: @location).mppt_devices
  end


  def get_location_logs
    @location_logs = Location.find(params[:id]).error_log
  end

  def tree
    location = Location.find(params[:id])
    @data    = []

    location.devices.each do |d|
      # 不是root則省略
      next if d.root != d

      @data << d.subtree.includes(device_model: :device_type).arrange_serializable do |parent, children|
        {
          id:                parent.id, 
          name:              parent.name,
          device_model_name: parent.device_model.try(:name),
          device_type_name:  parent.device_model.try(:device_type).try(:name),
          children:          children
        }
      end[0]
    end

  end

  private
  
  def location_params
    params.require(:location).permit(
      :name, :city, :area, :street,
      :contact_name, :contact_phone, :pr, :meter_date,
      :default_rate, :default_model_brand, :default_model_type, :image,
      :total_device, :total_power, :line_loss_rate, :decimal_point, 
      :average_insolation, :mppt_image, :photo, :longitude, :latitude
    )
  end

  def disable_parms
    params.require(:location).permit(:disable)
  end

  def get_graph(id, start_time, end_time, options={})
    # influxDB客戶端
    client      = get_influx_client
    time_format = '%FT%TZ'
    bound_time  = options[:bound_time]

    # 從influxDB查詢資料
    where_clause = "WHERE time >= '#{start_time.strftime(time_format)}' AND time < '#{end_time.strftime(time_format)}'"
    raw_items    = client.query "SELECT MAX(\"#{hour_power_field}\") FROM \"#{database_name}\" #{where_clause} GROUP BY TIME(24h) FILL(0)"
    # 如果start_time和end_time期間沒有資料，則不會有預設資料回傳回來
    # https://github.com/influxdata/influxdb/issues/6967
    if raw_items.count == 0
      raw_items[0] = {'values'=> []}
      ttime = start_time

      begin
        raw_items[0]['values'] << {'time'=> ttime.to_i, 'max'=> 0}
        ttime = ttime + 1.hours
      end while ttime < end_time
    end

    # 調整資料
    times = []
    total = 0
    data  = {label: '發電量', data:[]}
    raw_items[0]['values'].each do |item|
      ttime = DateTime.strptime(item['time'].to_s, '%s')
      times << ttime.strftime('%m/%d')
      
      if bound_time.present? && ttime >= bound_time
        sum = 0
      else
        sum = item['max']
      end
      total = total + sum
    end
    data[:data] << total
    {labels: times, datasets: [data]}
  end

  def database_name
    'power'
  end

  def hour_power_field
    'E-Hour'
  end

  def get_influx_client
    InfluxDB::Client.new(url: Rails.configuration.x.influxdb.url, epoch: 's')
  end
end



