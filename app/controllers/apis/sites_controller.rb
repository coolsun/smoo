class Apis::SitesController < ApisController
  def index
    authorize Site

		@sites = Site.all
	end

  def create
    authorize Site

    @site = Site.new(site_params)

    if @site.save
      render json: {message: 'ok'}
    else
      render_error(@site)
    end
	end

  def edit
    authorize Site

		@site = Site.find(params[:id])
	end

  def update
    authorize Site

    @site = Site.find(params[:id])

    if @site.update(site_params)
      render json: {message: 'ok'}
    else
      render_error(@site)
    end
	end

  def destroy
    authorize Site

    @site = Site.find(params[:id])

    if @site.destroy
      render json: {message: 'ok'}
    else
      render_error(@site)
    end
  end

  def disable_enable_site

    @location = Location.find(params[:id])

    if @location.update(location_params)
      render(json: {message: 'ok'})
    else
      render_error(@location)
    end

  end

  private
  
  def site_params
    params.require(:site).permit(:name)
  end

  def disable_parms
    params.require(:site).permit(:disable)
  end

end