class RolePolicy < ApplicationPolicy
  attr_reader :user, :r

  def initialize(user, r)
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
    r && 
    r.parent && 
    user.current_role.ancestor_of?(r) && 
    user.can?(*auth_data(__method__))
  end

  def update?
    edit?
  end
end