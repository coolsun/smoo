class Apis::DeviceTypesController < ApisController
  def index
		@device_types = DeviceType.all
  end

  def create
    @device_type = DeviceType.new(device_type_params)

    if @device_type.save
      render_ok
    else
      render_error(@device_type)
    end
  end

  def edit
		@device_type = DeviceType.find(params[:id])
	end

  def update
    @device_type = DeviceType.find(params[:id])

    if @device_type.update(device_type_params)
      render_ok
    else
      render_error(@device_type)
    end
  end
  
  # TODO: 刪除前的檢查
  def destroy
    @device_type = DeviceType.find(params[:id])

    if @device_type.destroy
      render_ok
    else
      render_error(@device_type)
    end
  end  

  def get_normalization_properties
    @normalization_properties = DeviceType.find(params[:id]).normalization_properties
  end

  # TODO: 刪除前的檢查
  def update_normalization_properties
    @device_type = DeviceType.find(params[:id])
    
    if @device_type.update(normalization_properties_params)
      render_ok
    else
      render_error(@device_type)
    end
  end  

  private 

  def device_type_params
    params.require(:device_type).permit(:name)
  end

  def normalization_properties_params
    params.require(:device_type).
    permit(normalization_properties_attributes: [:id, :name, :kind, :unit, :required, :_destroy])
  end
  
end