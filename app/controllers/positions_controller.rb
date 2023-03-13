class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def create
    @position = Position.create(position_params)
  end

  private
  def position_params
    params.permit(:position)
  end
end
