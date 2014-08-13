class MegamanController < ApplicationController
  respond_to :html, :json
  self.responder = MegamanResponder

  def show
    @megaman = Character.find(...)

    @megaman.try_for_powerup
    respond_with @megaman

    # respond_with @megaman do |format|
    #   format.html { redirect_to boss_selection_path(@megaman) }
    #   format.json { 
    #     if @megaman.errors.present?
    #       render json: MegamanErrorsJSON.new(@megaman)
    #     else
    #       render json: @megaman
    #     end
    #   }
    # end
  end

end
