class StartDaysController < ApplicationController
  before_action :move_to_index, only: [:index]

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
    @start_day = StartDay.create(start_day_params)
    redirect_to root_path
  end

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
