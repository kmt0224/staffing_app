class StaffingsController < ApplicationController
  def index
    get_week
  end

  def edit
  end

  private
  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)','(日)','(月)','(火)','(水)','(木)','(金)','(土)']
    @todays_date = Date.today

    @week_days = []

    14.times do |x|      
      wday_num = Date.today.wday + x
      if wday_num >= 14
        wday_num = wday_num - 14
      end

      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, wday: wdays[wday_num]}

      @week_days.push(days)
      end
    end

end
