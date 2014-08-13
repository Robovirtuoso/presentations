class MarioController < ApplicationController
  rescue_from Mario::AlreadyPoweredUp do
    redirect_to mario_path(@mario, params.except(:power_up))
  end

  rescue_from Mario::Shrunk, :mario_shrunk

  def show
    @mario = Character.find(params[:mario_id])
    PowerUpService.new(@mario, params[:power_up])

    respond_with @mario
  end

  protected

  def mario_shrunk
    @mario.notify_player_shrunk

    respond_to do |format|
      format.html { render @mario }
      format.json { render json: Mario::ShrunkJSON.new(@mario) }
    end
  end

end
