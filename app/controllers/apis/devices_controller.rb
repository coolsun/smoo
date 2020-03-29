class Apis::DevicesController < ApisController
  def index
    authorize Device

		@devices = Device.includes(:device_model).all
  end
  
  def new
    authorize Device

    @device_models = DeviceModel.all
    @locations     = Location.all
    @devices       = Device.all
  end

  def create
    authorize Device

    @device = Device.new(device_params)

    if @device.save
      render json: {message: 'ok'}
    else
      render_error(@device)
    end
	end

  def edit
    authorize Device

    @device = Device.find(params[:id])

    @device_models = DeviceModel.all
    @locations     = Location.all
    @devices       = Device.where('id NOT IN (?)', @device.descendants.map(&:id) << @device.id)
	end

  # TODO: LOCK, CHECK AND DESTROY MPPT
  def update
    authorize Device

    @device = Device.find(params[:id])

    if @device.update(device_params(check_device_is_parent: @device))
      render json: {message: 'ok'}
    else
      render_error(@device)
    end
	end

  def destroy
    authorize Device

    device = Device.find(params[:id])

    if device.destroy
      render json: {message: 'ok'}
    else
      render_error(device)
    end
  end

  def upload_new_device
    authorize Device

    @response = ""
    if params['upload_xlsx']
      if !params['upload_xlsx'].original_filename.downcase.end_with?('.xlsx')
        @response = "Can't find .xlsx file"
        return false
      end
      name =  Time.now.in_time_zone("Taipei").strftime('%Y-%m-%d_%H%M_') + params['upload_xlsx'].original_filename
      directory = "public/uploads/device"
      # create the file path
      path = Rails.root.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(params['upload_xlsx'].read) }

      @response = new_device_from_upload_xlsx(path)

    end
  end

  def upload_new_device_property

    @response = ""
    if params['upload_xlsx']
      if !params['upload_xlsx'].original_filename.downcase.end_with?('.xlsx')
        @response = "Can't find .xlsx file"
        return false
      end
      name =  Time.now.in_time_zone("Taipei").strftime('%Y-%m-%d_%H%M_') + params['upload_xlsx'].original_filename
      directory = "public/uploads/device_property"
      # create the file path
      path = Rails.root.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(params['upload_xlsx'].read) }

      @response = device_property_from_upload_xlsx(path)

    end
  end

  def get_properties
    authorize Device

    @device_properties = DeviceModel.find(params[:id]).device_properties
  end

  def update_properties
    authorize Device

    @device = Device.find(params[:id])
    
    if @device.update(properties_params)
      render json: {message: 'ok'}
    else
      render_error(@device_model, resource: {without_key: true})
    end
  end


  def update_mppt_coordinates
    authorize Device
    
    @device = Device.find(params[:id])

    if @device.update(mppt_coordinates_params)
      render json: {message: 'ok'}
    else
      render_error(@device)
    end
  end

  private

  def device_params(options={})
    data          = params.require(:device).permit(:name, :device_model_id, :location_id)
    parent_device = Device.find_by_id(params[:parent_device_id])

    if parent_device.present? 
      data.merge!(parent: parent_device)

      device = options[:check_device_is_parent]
      data.delete(:parent) if device.present? && parent_device.child_of?(device)
    else
      data.merge!(parent: nil)
    end

    data
  end

  def properties_params
    params.require(:device).permit(device_properties_attributes: [:id, :name, :type, :value, :normalize, :_destroy])
  end

  def new_device_from_upload_xlsx(path)

    batch_xlsx = Roo::Excelx.new(path)
    coordinate_switch = {}
    begin
      Device.transaction do
        batch_xlsx.last_row.times do |i|
          new_devices = []
          index = i + 1
          if index == 1
            batch_xlsx.last_column.times do |title_i|
              title_index = title_i + 1
              coordinate_switch[batch_xlsx.cell(1,title_index).squish] = title_index
            end

            next
          end
          next if batch_xlsx.cell(index, coordinate_switch["device_model"]).blank?
          device_model = DeviceModel.find_by_name(batch_xlsx.cell(index, coordinate_switch["device_model"]))
          raise 'Not Found Device Model' if !device_model

          location     = Location.find_by_name(batch_xlsx.cell(index, coordinate_switch["location"]))
          raise 'Not Found Location' if !location

          logger.info "==---------------------------------==#{index}==="
          logger.info "==---------------------------------==#{batch_xlsx.cell(index, coordinate_switch["name"])}==="
          logger.info "==---------------------------------==#{device_model.id}==="
          logger.info "==---------------------------------==#{location.id}==="

          new_devices << {
            "device"=>{
              "name" => batch_xlsx.cell(index, coordinate_switch["name"]),
              "device_model_id" => device_model.id,
              "location_id" => location.id,
            },
            "parent_device_id" => batch_xlsx.cell(index, coordinate_switch["parent"])
          }

          logger.info "=============================#{new_devices}==="
          new_devices.each do |new_device|
            parent_device = Device.find_by_name(new_device["parent_device_id"])
            if parent_device.present? 
              new_device["device"].merge!(parent: parent_device)
            else
              new_device["device"].merge!(parent: nil)
            end
            GC.start
            logger.info "==---------------------------------==#{new_device}==="
            device = Device.new(new_device["device"])
            device.save!
          end

          #get device_property_value
          device = Device.find_by_name(batch_xlsx.cell(index, coordinate_switch["name"]))

          if device.device_model.device_type.name == "module" 
            device_property_value = JSON.parse(batch_xlsx.cell(index, coordinate_switch["device_properties"]))

            logger.info "==---------------------------------==#{device.name}==="
            logger.info "==---------------------------------==#{device_property_value}===" 

            device_property_value.keys.each do |value|
                logger.info "==---------------------------------==#{value}==="
                logger.info "==---------------------------------==#{device_property_value[value]}==="

                device_property = device.device_model.device_type.device_properties.find_by_name(value)
                device.device_property_values.create(value: device_property_value[value], device_property: device_property)
            end
          else
            logger.info "==---------------------------------==#{device.name}==="

            device_property_value = JSON.parse(batch_xlsx.cell(index, coordinate_switch["device_properties"]))

            logger.info "==---------------------------------==#{device_property_value[0].keys}==="
            device_property_value.each do |value|
              value.keys.each do |v|
                logger.info "==---------------------------------==#{v}==="
                logger.info "==---------------------------------==#{value[v]}==="

                device_property = device.device_model.device_type.device_properties.find_by_name(v)
                device.device_property_values.create(value: value[v], device_property: device_property)
              end
            end
          end
        end
      end   
      render json: {message: 'device ok'}
    rescue => e
      render_error(e.message)  
    end
  end

  def device_property_from_upload_xlsx(path)

    batch_xlsx = Roo::Excelx.new(path)
    coordinate_switch = {}
    device_properties = []
    begin
      DeviceProperty.transaction do
        batch_xlsx.last_row.times do |i|
          index = i + 1
          if index == 1
            batch_xlsx.last_column.times do |title_i|
              title_index = title_i + 1
              coordinate_switch[batch_xlsx.cell(1,title_index).squish] = title_index
            end

            next
          end

          next if batch_xlsx.cell(index, coordinate_switch["device property"]).blank?

          device_property = JSON.parse(batch_xlsx.cell(index, coordinate_switch["device property"])) 
          logger.info "=============================#{device_property["property"][0]["require"]}==="

          device_property["property"].each do |property|

            device_type = DeviceType.find_by_name(batch_xlsx.cell(index, coordinate_switch["type"]))
            raise 'Not Found Device Type' if !device_type

            logger.info "==---------------------------------==#{index}==="
            logger.info "==---------------------------------==#{batch_xlsx.cell(index, coordinate_switch["type"])}==="
            logger.info "==---------------------------------==#{device_type.id}==="
          
            device_properties << {
                "device_type_id"   => device_type.id,
                "level"             => "d",
                "name"              => property["name"],
                "kind"              => property["type"],
                "required"          => property["require"]
            }
          end
        end
        
        logger.info "=============================#{device_properties}==="
         device_properties.each do |d|
             GC.start
             logger.info "==---------------------------------==#{d}==="
             d = DeviceProperty.new(d)
             d.save!
           end
         render json: {message: 'ok'}
      end
    rescue => e
      render_error(e.message)  
    end
  end

  def mppt_coordinates_params
    params.require(:device).permit(mppt_coordinates: [:x, :y])
  end

end