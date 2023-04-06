class StartDaysController < ApplicationController

  def index
    @start_day
  end

  def create
    @start_day = StartDay.new(start_day_params)
    if @start_day.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def start_day_params
    params.permit(:start_day)
  end


end
