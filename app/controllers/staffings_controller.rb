class StaffingsController < ApplicationController
  before_action :move_to_start_days

  def index
    @get_week = get_week
  end

  def new
    @get_week = get_week
    @members = Member.all
    @positions = Position.all.map {|position| [position.position, position.id]}
    @staffing = Form::StaffingCollection.new
  end

  def create
    @staffing =  Form::StaffingCollection.new(staffing_params)
    if @staffing.save
      redirect_to action: :index
    else
      render :staffings_path
    end
  end

  end
  

  private
  def move_to_start_days
    start_day = StartDay.all
    if start_day.blank?
      redirect_to start_days_path
    end
  end

  def staffing_params
    params.require(:form_staffing_collection).permit(staffings_attributes: [:member_id, :position_id, :date])
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)','(日)','(月)','(火)','(水)','(木)','(金)','(土)']
    StartDay.all.each do |day|
      @todays_date = day.start_day
    end

    @week_days = []

    
    staffings = Staffing.where(date: @todays_date..@todays_date + 13)

    14.times do |x|      
      wday_num = @todays_date.wday + x
      if wday_num >= 14
        wday_num = wday_num - 14
      end

      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, wday: wdays[wday_num]}

      @week_days.push(days)
      end
    end

    # def staffing_params
    #   params.require(:staffing).permit(:startDate, :date).marge(member_id: @member.id, position_id: @position.id)
    # end
end
