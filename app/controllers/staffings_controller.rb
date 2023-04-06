class StaffingsController < ApplicationController
  before_action :move_to_start_days

  def index
    get_week
    @members = Member.all
    @staffing = Form::StaffingCollection.new
    pick_uniq
  end

  def new
    get_week
    @members = Member.all
    @positions = Position.all.map {|position| [position.position, position.id]}
    @staffing = Form::StaffingCollection.new
  end

  def create
    get_week
    @members = Member.all
    @positions = Position.all.map {|position| [position.position, position.id]}
    @staffing =  Form::StaffingCollection.new(staffing_params)
   if @staffing.save
    redirect_to root_path
   else
    render :new
   end
  end


  def destroy_all
    Staffing.destroy_all
    StartDay.destroy_all
    redirect_to root_path
  end

  private
  # start_dayが無いと自動遷移
  def move_to_start_days
    start_day = StartDay.all
    if start_day.blank?
      redirect_to start_days_path
    end
  end

  #一括保存のストロングパラメーター
  def staffing_params
    params.require(:form_staffing_collection).permit(staffings_attributes: [:member_id, :position_id, :date])
  end

  #4回以上の重複内容を取得するメソッド
  def pick_uniq
    member_positions = []
    Staffing.all.each do |s|
      member_position = {member: s.member.name, position: s.position.position}
      member_positions.push(member_position)
    end
    @pick_uniq = member_positions.select{|e| member_positions.count(e) > 3 }.uniq
  end

  #2週間分の日付、曜日、人員配置を取得するメソッド
  def get_week
    #wdayを数字ではなく漢字の曜日で取得するため
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)','(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    #表示の開始日をstart_dayに指定する
    StartDay.all.each do |day|
      @todays_date = day.start_day
    end

    @week_days = []
    
    staffings = Staffing.where(date: @todays_date..@todays_date + 13)
    today_staffings = []
    staffings.each do |s|
      today_staffing = {member: s.member.name, position: s.position.position, date: s.date}
      today_staffings.push(today_staffing)
    end
    
    14.times do |x|  
      staffing = []
      today_staffings.count.times do |i|
        if today_staffings[i][:date] == @todays_date + x 
          staffing.push(today_staffings[i][:position])
        end
      end


      wday_num = @todays_date.wday + x

      if wday_num >= 14
        wday_num = wday_num - 14
      end
      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, staffing: staffing, wday: wdays[wday_num]}

      @week_days.push(days)
    end
  end
end
