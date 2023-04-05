class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def create
    @position = Position.create(position_params)
    redirect_to positions_path
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to positions_path
  end

  private
  def position_params
    params.permit(:position)
  end
end
