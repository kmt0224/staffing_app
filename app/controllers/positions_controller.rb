class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def create
    @position = Position.create(position_params)
  end

  def destroy
    @position = Position.find(params[:id])
    @osition.destroy
    redirect_to root_path
  end

  private
  def position_params
    params.permit(:position)
  end
end
