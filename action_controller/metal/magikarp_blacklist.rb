class MagikarpsController < ActionController::Metal

  EXCLUDED_MODULES = [
    :Helpers :HideActions :ConditionalGet AbstractController::Callback :Rescue
    :Instrumentation :StrongParameters :DataStreaming :Streaming
  ]

  ActionController::Base.without_modules(EXCLUDED_MODULES).each do |mod|
    include mod
  end

  def index
    render 'magikarps/index'
  end

end
