class Apis::DeviceModelsController < ApisController
  def index
    authorize DeviceModel

		@device_models = DeviceModel.all
  end
  
  # TODO: 與edit整合
  def new
    device_types = DeviceType.all.includes(:device_properties)

    @device_types_data = []
    device_types.each do |dt|
      @device_types_data << {
        id: dt.id,
        name: dt.name,
        props: dt.device_properties.select{|prop| prop.level = 'm'}
      }
    end

    @brands = Brand.all
    @models = Model.all
  end

  # TODO: TRANSCATION
  # TODO: 檢查property
  def create
    authorize DeviceModel

    @device_model = DeviceModel.new(device_model_params)

    if @device_model.save
      render_ok
    else
      render_error(@device_model)
    end
	end

  # TODO: 與new整合
  def edit
    authorize DeviceModel

    @device_model = DeviceModel.find(params[:id])

    device_types = DeviceType.all.includes(:device_properties)
    @device_types_data = []
    device_types.each do |dt|
      @device_types_data << {
        id: dt.id,
        name: dt.name,
        props: dt.device_properties.select{|prop| prop.level = 'm'}
      }
    end

    @brands = Brand.all
    @models = Model.all    
	end

  # TODO: LOCK
  # TODO: TRANSCATION
  # TODO: 優化修改properties的方法
  def update
    authorize DeviceModel
    @device_model = DeviceModel.find(params[:id])

    @device_model.device_property_values.delete_all
    if @device_model.update(device_model_params)
      render_ok
    else
      render_error(@device_model)
    end
	end

  def destroy
    authorize DeviceModel

    @device_model = DeviceModel.find(params[:id])

    # 判斷是否已跟device關聯
    if  @device_model.devices.count > 0
      render_error("#{@device_model.name} has associated with devices")
      return
    end

    if @device_model.destroy
      render json: {message: 'ok'}
    else
      render_error(@device_model)
    end
  end

  def get_properties
    authorize DeviceModel

    @device_model_properties = DeviceModel.find(params[:id]).device_model_properties
  end

  def update_properties
    authorize DeviceModel
    
    @device_model = DeviceModel.find(params[:id])
    
    if @device_model.update(properties_params)
      render json: {message: 'ok'}
    else
      render_error(@device_model, resource: {without_key: true})
    end
  end

  private
  
  def device_model_params
    params.require(:device_model).permit(:name, :brand_id, :model_id, :device_type_id, device_property_values_attributes:[
      :id, :value, :_destroy, :device_property_id
    ])
  end

  # def prop_value_params
  #   params.require(:device_model).permit(device_property_values_attributes:[
  #     :id, :value, :_destroy, :device_property_id
  #   ])
  # end

  def properties_params
    params.require(:device_model).
    permit(device_model_properties_attributes: [:id, :name, :kind, 
                                                :unit, :gain, :address, 
                                                :quantity, :count, :_destroy
                                               ])
  end

end