class Apis::RolesController < ApisController
  def index
    authorize Role
    
    # 資料不會很大量，直接給前端處理分頁
    if current_user.current_role.is_admin?
      @roles = Role.includes(:users).all
    else
      @roles = Role.includes(:users).where(id: current_user.current_role.descendants.map(&:id))
    end
  end

  def new
    authorize Role

    @r = Role.new(parent: Role.get_admin)
    @selected_actions, @unselected_actions = create_edit_render_data(@r)
  end

  # MUST LOCK
  # MUST TRANSCATION
  def create
    authorize Role

    @r = Role.new(create_role_params.merge!(parent: Role.get_admin))
    render_error(@r) && return if !@r.save

    permission_map = Permission.all.inject({}) {|h, permission| h[permission.id] = permission; h}
    params[:selected_actions].each do |data|
      update_ra = RolesAction.find(data[:ra_id])
      ra = @r.roles_actions.create(action: update_ra.action)

      data[:permissions].each do |p_data|
        permission = permission_map[p_data[:p_id]]
        ra.roles_actions_permissions.create(permission: permission) if p_data[:execute]
      end
    end

    render json: {message: 'ok'}
  end

  def edit
    @r = find_role
    authorize @r

    @selected_actions, @unselected_actions = create_edit_render_data(@r)
  end

  # MUST LOCK
  # MUST TRANSCATION
  def update
    r = find_role
    parent_r = find_role(r.parent.id)
    authorize r

    # 更新
    permission_map = Permission.all.inject({}) {|h, permission| h[permission.id] = permission; h}
    params[:selected_actions].each do |data|
      update_ra = RolesAction.find(data[:ra_id])

      if update_ra.role == r
        if data[:_destroy] == true
          roles = r.descendants.to_a << r
          RolesAction.where(action: update_ra.action, role: roles).destroy_all
          next
        end

        destroy_permissions = []
        data[:permissions].each do |p_data|
          permission = permission_map[p_data[:p_id]]
          execute = p_data[:execute]

          if p_data[:rap_id].blank? && execute
            update_ra.roles_actions_permissions.create(permission: permission)
          elsif p_data[:rap_id].present? && !execute
            destroy_permissions << permission
          end
        end

        if !destroy_permissions.empty?
          ra_ids = RolesAction.where(action: update_ra.action, role: r.descendants).map(&:id) << update_ra.id
          RolesActionsPermission.where(roles_action_id: ra_ids, permission: destroy_permissions).delete_all
        end
      elsif update_ra.role == parent_r
        ra = r.roles_actions.create(action: update_ra.action)

        data[:permissions].each do |p_data|
          permission = permission_map[p_data[:p_id]]
          ra.roles_actions_permissions.create(permission: permission) if p_data[:execute]
        end
      end
    end

    # Render edit date
    @r = find_role
    @selected_actions, @unselected_actions = create_edit_render_data(@r)
    render :edit
  end

  private

  def find_role(id=nil)
    id ||= params[:id]
    role = Role.includes(roles_actions: [:action, roles_actions_permissions: :permission]).find_by_id(id)
    role.present? ? role : false
  end

  def create_edit_render_data(r)
    # 使用includes防止重複query資料庫
    parent_r = find_role(r.parent.id)

    r_action_ids = r.roles_actions.map {|r_ra| r_ra.action.id}
    selected_actions = []
    unselected_actions = []

    # 未選擇的actions
    parent_r.roles_actions.select{|ra| !r_action_ids.include?(ra.action.id)}.each do |ra|
      unselected_action = {
        ra_id: ra.id,
        name: ra.action.name,
        permissions: ra.roles_actions_permissions.map{|rap| {
          p_id: rap.permission.id,
          name: rap.permission.name,
          execute: false,
          sort: rap.permission.sort}
        }
      }

      unselected_action[:permissions].sort_by!{|permission| permission[:sort]}
      unselected_actions << unselected_action
    end

    # 已選擇的actions
    r.roles_actions.each do |ra|
      selected_action = {ra_id: ra.id, name: ra.action.name, permissions: []}
      selected_action[:permissions] = ra.roles_actions_permissions.map do |rap|
        {
          rap_id: rap.id,
          p_id: rap.permission.id,
          name: rap.permission.name,
          execute: true,
          sort: rap.permission.sort
        }
      end

      r_permission_ids = ra.roles_actions_permissions.map{|rap| rap.permission.id}
      parent_r_ra = parent_r.roles_actions.select{|parent_r_ra| parent_r_ra.action.id == ra.action.id}.first

      parent_r_ra.roles_actions_permissions.select{|rap| !r_permission_ids.include?(rap.permission.id)}.each do |rap|
        selected_action[:permissions] << {
          p_id: rap.permission.id,
          name: rap.permission.name,
          execute: false,
          sort: rap.permission.sort
        }
      end

      selected_action[:permissions].sort_by!{|permission| permission[:sort]}
      selected_actions << selected_action
    end

    return [selected_actions, unselected_actions]
  end

  def create_role_params
    data = params.require(:role).permit(:name, :resource_type)
    data[:resource_type] = nil if data[:resource_type] == '*'

    data
  end

end