class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def auth_data(method_name)
    [self.class.name.match("^([A-Za-z]+)Policy$")[1], method_name[0..-2]]
  end

  def site_scope_authorize
    role = user.current_role
    return true if user.is_admin?

    site = user.site
    return site.present? && record.present? && site.id == record.id
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
