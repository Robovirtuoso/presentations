class MarioController < ApplicationController
  def show
    @mario = Character.find(params[:mario_id])

    begin
      if params[:power_up] && params[:power_up] == 'fire_flower'
        @mario.power_up_with_firepower(params[:power_up])
      elsif params[:power_up].present?
        @mario.power_up(params[:power_up])
      end

      @mario.throw_fireball if @mario.powered_up_with_fire?

      respond_to do |format|
        format.html { render @mario }
        format.json { render json: @mario }
      end

    rescue Mario::AlreadyPoweredUp
      params[:mario].delete(:power_up)

      redirect_to mario_path(@mario, params)

    rescue Mario::Shrunk
      @mario.notify_player_shrunk

      respond_to do |format|
        format.html { render @mario }
        format.json { render json: @mario.shrunk_json }
      end

    end
  end
end
