class Apis::GlobalConfigsController < ApisController
  def index
    @configs = GlobalConfig.to_arr
  end
end