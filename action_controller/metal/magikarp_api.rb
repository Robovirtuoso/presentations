class Api::MagikarpsController < ActionController::Metal
  include Rails.application.routes.url_helpers
  include ActionController::UrlFor
  include ActionController::Rendering
  include ActionController::Renderers::All
  include ActionController::MimeResponds

  def show
    render json: Magikarp.find(params[:id])
  end

end
