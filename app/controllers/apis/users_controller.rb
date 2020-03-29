class Apis::UsersController < ApisController
  def index
    authorize User

		@users = User.all
	end

  def create
    authorize User
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    password = (0...50).map { o[rand(o.length)] }.join
    @user = User.new(user_params)
    @user.password = password
    @user.password_confirmation = password

    if @user.save
      render json: {message: 'ok'}
    else
      render_error(@user)
    end
  end

  def edit
    authorize User 

    @user = User.find(params[:id])
  end

  def get_user_roles
    authorize User 

    @user_roles = User.find(params[:id]).roles
  end

  def update_user_roles
    authorize User 

    @user = User.find(params[:id])
    @user_roles = Role.find(user_role_params[:id])
    site = Site.find(user_role_params[:resource_id])

    if @user.has_role? user_role_params[:name],site
      if @user_roles.update(user_role_params)
        render json: {message: 'update user roles ok'}
      else
        render_error(@user_roles)
      end
    else
      @user.add_role user_role_params[:name],site
      render json: {message: 'add new role ok'}
    end

  end

  def destroy_user_roles
    authorize User 
    
    @user = User.find(params[:id])

    if user_role_params[:destory] == true
      @user.remove_role user_role_params[:name]
      render json: {message: 'ok'}
    else
      render_error(@user)
    end
  end

  def update
    authorize User

    @user = User.find(params[:id])

    if@user.update(user_params)
      render json: {message: 'ok'}
    else
      render_error(@user)
    end
  end
  
  def destroy
    authorize User

    @user = User.find(params[:id])

    if @user.destroy
      render json: {message: 'ok'}
    else
      render_error(@user)
    end
  end

  def user_params
    #params.require(:user).permit(:email, :name, :password, :password_confirmation)
    params.require(:user).permit(:email, :name, :last_name, :first_name, :phone, :address, :sex)
  end

  def user_role_params
    params.require(:role).permit(:id, :name, :resource_id)
  end
  
end