class Apis::BoardsController < ApisController
  before_action :find_board, except: [:index, :create]

  def index
    if current_user.is_admin?
      @boards = Board.all
    else
      @boards = Board.where(site: current_user.site)
    end
  end

  def show
    @bls              = @board.boards_locations.includes(:location)
    @locations        = @board.locations
    extra_properties  = [:daily_power, :total_power, :pr_percentage, :temperature, :wx]
    setter            = Util::LocationPropertySetter.new
    @data             = []

    @bls.each do |bl|
      location = bl.location
      setter.set(location, extra_properties)

      d = {
        index:      bl.index,
        name:       location.name,
        updated_at: location.updated_at
      }

      extra_properties.each {|prop| d[prop] = location.send(prop)}
      @data << d
    end

  end

  def create
    site   = current_user.site
    @board = site.boards.build(board_params)

    render_error(@board) && return if !@board.save
    
    @board.reload # 讀取id
  end

  def edit
  end

  def update
    if @board.update(board_params)
      render_ok
    else
      render_error(@site)
    end
  end

  def edit_locations
    locations        = @board.site.locations
    @selected_data   = []

    locations.each do |l|
      selected_bl = @board.boards_locations.find{|bl| bl.location_id == l.id}

      @selected_data << {
        location_id: l.id, 
        name: l.name,
        selected: selected_bl.present?,
        index: selected_bl.try(:index)
      }
    end
  end

  # TODO: TRANSCATION
  def update_locations
    new_locations = []
    update_locations_params[:locations].each do |d|
      bl = @board.boards_locations.find_by_location_id(d[:location_id])

      Rails.logger.info(d[:selected])
      if d[:selected] == false
        bl.destroy if bl.present?
        next
      end

      if bl.present?
        bl.update(index: d[:index])
      else
        @board.boards_locations.create(location_id: d[:location_id], index: d[:index])
      end
    end
    
    render_ok
  end

  def edit_locations_order
  end

  # TODO: TRANSCATION
  def update_locations_order
    update_locations_order_params[:locations].each do |d|
      bl = @board.boards_locations.find_by_location_id(d[:location_id])
      bl.update(index: d[:index]) if bl.present?
    end

    render_ok
  end

  def destroy
    if @board.destroy
      render_ok
    else
      render_error(@board)
    end
  end

  private

  def board_params
    params.require(:board).permit(:name, :firm_name, :count, :carousel_second, :comment)
  end

  def update_locations_params
    params.require(:board).permit(locations: [:location_id, :index, :selected])
  end

  def update_locations_order_params
    params.require(:board).permit(locations: [:location_id, :index])
  end

  def find_board
    @board = Board.find(params[:id])
    site_scope_authorize(@board.site)
  end

end