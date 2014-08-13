class MarioController < ApplicationController

  def show
    begin
      @mario = Character.find(params[:mario_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to luigi_path, error: "Mario isn't playable at this point in the game"
    end

    render @mario
  end

  def update
    @mario = Character.find(params[:mario_id])
    begin
      @mario.update_attributes!(params[:mario])
    rescue ActiveRecord::RecordInvalid
      redirect_to koopa_path, error: "Power up shroom failed"
    end

    redirect_to mario_kart_path(@mario)
  end

end
