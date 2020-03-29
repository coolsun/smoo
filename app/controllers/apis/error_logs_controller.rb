class Apis::ErrorLogsController < ApisController
  def index
    @log = ErrorLog.all
  end

  def create

    @log = ErrorLog.new(site_params)

    if @log.save
      render json: {message: 'ok'}
    else
      render_error(@log)
    end
  end

  def destroy
    @log = ErrorLog.find(params[:id])

    if @log.destroy
      render json: {message: 'ok'}
    else
      render_error(@log)
    end
  end

  def get_location_logs
    @location_logs = Location.find(params[:id]).error_logs
  end
  
  
    private
end