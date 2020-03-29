class ApisController < ApplicationController
  include Pundit

  skip_before_action :verify_authenticity_token

  # 驗證使用者登入
  before_action :authenticate_user!

  # 設定使用者的角色
  before_action :set_role

  # 驗證權限
  # before_action :policy_authorize

  # 沒有執行權限時，則會呼叫not_authorized函數
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def authenticate_user!
    render_error('User must login') && return if current_user.blank?
  end

  def not_authorized
    render_error('You are not authorized to perform this action.')
  end

  def set_role
    current_user.current_role = current_user.roles.first
  end

  # 設定controller的pundit policy，之後每次執行action時，
  # 都會先呼叫對應的pundit policy action去驗證權限
  def self.set_policy(name)
    @@policy = name
  end

  # 驗證user是否可以存取這個action
  def policy_authorize
    raise 'Please set policy' if @@policy.blank?

    policy = @@policy
    permission = action_name

    authorize policy, "#{permission}?"
  end

  # 驗證user的site scope
  def site_scope_authorize(site)
    ApplicationPolicy.new(current_user, site).site_scope_authorize
  end

  # 若controller的action會修改到有關於site的resource
  # 則需要帶此函數驗證
  def find_resource(model)
    resource = model.find(params[:id])
    site_scope_authorize(resource.site)

    resource
  end

  def render_ok
    render json: {message: 'ok'}
  end

  # 目前用在resource建立或更新失敗時,回傳一個status為412的response給client.
  # msg參數可以帶入string或者是resource, 若是帶入resource, 則調用resource_error_msg去分析resource的error message.
  #
  # 1.msg is resource
  #   site = Site.new
  #   site.save # false
  #   render_error(site)
  #
  # 2.msg is string
  #   render_error("error message")
  #
  def render_error(msg, options={})
    status = options[:status] || 412
    msg    = resource_error_msg(msg, options[:resource]||{}) if !msg.is_a?(String)

    render json: {message: msg}, status: status
  end

  def resource_error_msg(resource, options={})
    without_key = options[:without_key]

    resource.errors.map do |k, v| 
      without_key ? v : "#{k}: #{v}"
    end.join('<br/>').html_safe
  end

end
  