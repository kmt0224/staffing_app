class MembersController < ApplicationController
  before_action :move_to_start_days
  before_action :move_to_index, only: [:index]


  def index
    @members = Member.all
  end

  def create
    @member = Member.create(member_params)
    redirect_to members_path
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end

  private
  def member_params
    params.permit(:name)
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
