class MagikarpsController < ActionController::Metal
  include ActionController::Rendering
  include ActionController::Layouts
  append_view_path "#{Rails.root}/app/views"

  def index
    render "magikarps/index"
  end

end

#config/routes.rb

get 'magikarps', to: MagikarpsController.action(:index)
