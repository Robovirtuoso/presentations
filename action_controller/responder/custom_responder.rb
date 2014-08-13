# to_html
# to_json
# to_js
# has_error?
# default_render
# resource_errors

class MegamanResponder < ActionController::Responder
  def to_html
    if !has_error?
      controller.redirect_to controller.boss_selection_path(resource)
    else
      controller.render 'edit'
    end
  end

  def to_json
    if has_error?
      display_errors
    else
      default_render
    end
  end

  def json_resource_errors
    Megaman::ErrorsJSON.new(resource)
  end

end
