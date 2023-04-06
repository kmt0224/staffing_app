class PositionsController < ApplicationController
  before_action :move_to_start_days
  before_action :move_to_index, only: [:index]


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

  def move_to_start_days
    start_day = StartDay.all
    unless start_day.exists?
      redirect_to start_days_path
    end
  end

  def move_to_index
    if Staffing.exists?
      redirect_to root_path
    end
  end

end
