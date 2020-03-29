class SessionsController < Devise::SessionsController
	skip_before_action :verify_authenticity_token
	respond_to :json

	def create
    self.resource = warden.authenticate!(auth_options)
		sign_in(resource_name, resource)
		render json: {message: 'ok'}
	end
	
	def destroy
    sign_out(resource_name)
		render json: {message: 'ok'}
  end
end