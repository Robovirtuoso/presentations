class RescuedController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :record_not_found

  rescue_from Resource::RecordInvalid do
    redirect_to koopa_path, error: "Shroom didn't work"
  end

  def show
    @mario = Character.find(params[:mario_id])

    render @mario
  end

  def update
    @mario = Character.find(params[:mario_id])
    @mario.update_attributes(params[:mario])

    redirect_to mario_path(@mario)
  end

  private

  def record_not_found
    redirect_to luigi_path, error: "Princess is in another castle"
  end

end
