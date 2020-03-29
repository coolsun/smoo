class DevicePolicy < ApplicationPolicy
  attr_reader :user ,:r

  def initialize(user,r)
    @user = user
    @r = r
  end

  def index?
    user.can?(*auth_data(__method__))
  end

  def new?
    user.can?(*auth_data(__method__))
  end

  def create?
    new?
  end

  def edit? 
    user.can?(*auth_data(__method__))
  end

  def update?
    edit?
  end

  def destroy?
    user.can?(*auth_data(__method__))
  end

  def upload_new_device?
    edit?
  end

  def get_properties?
    index?
  end

  def update_properties?
    edit?
  end

  def update_mppt_coordinates?
    edit?
  end

end