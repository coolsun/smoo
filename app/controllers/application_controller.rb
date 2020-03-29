class ApplicationController < ActionController::Base
  def render_vue
    render file: "#{Rails.root}/public/index.html", layout: false
  end
end
