class LocationPolicy < ApplicationPolicy
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

  def graphs?
    index?
  end

  def model_properties?
    index?
  end

  def mppts?
    index?
  end

  def graph?
    index?
  end

end