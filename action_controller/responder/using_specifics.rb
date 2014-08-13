class MegamanController < ApplicationController
  def update
    @megaman = Character.find(...)
    @megaman.update_attributes(...)

    respond_with @megaman, responder: responder_for(@megaman.power_up)
  end

  protected

  def responder_for(power)
    MegamanController.const_get("#{power.classify}Responder", false)
  end

end

# app/controllers/megaman_controller/

class MegamanController::ElectricityResponder < ActionController::Responder
  def to_html
    controller.render resource
  end

  def to_json
    controller.render json: Megaman::ElectricityJSON.new(resource)
  end
end

class MegamanController::WaterResponder < ActionController::Responder
  def to_html
    controller.redirect_to fire_man_path(resource)
  end

  def to_json
    controller.render json: Megaman::WaterJSON.new(resource)
  end
end
