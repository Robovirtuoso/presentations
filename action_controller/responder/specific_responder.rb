class MegamanController < ApplicationController

  def update
    @megaman = Character.find(...)
    @megaman.update_attributes(...)

    if @megaman.powered_up_with?('electriciy')
      respond_to do |format|
        format.html { render @megaman }
        format.json { render json: @megaman.electricity_json }
      end

    elsif @megaman.powered_up_with?('water')
      respond_to do |format|
        format.html { redirect_to fire_man_path(@meagman) }
        format.json { render json: @megaman.water_json }
      end
    end

    redirect_to current_level_path(@megaman)
  end


end
