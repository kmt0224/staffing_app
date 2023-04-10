class StartDaysController < ApplicationController
  before_action :move_to_index, only: [:index]

  def index
    @start_day
  end

  def create
    @start_day = StartDay.create(start_day_params)
    redirect_to root_path
  end

  def destroy_all
    StartDay.destroy_all
    redirect_to root_path
  end

  private
  def start_day_params
    params.permit(:start_day)
  end

  def move_to_index
    if Staffing.exists? || StartDay.exists?
      redirect_to root_path
    end
  end

end
