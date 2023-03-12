class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def create
    @member = Member.create(member_params)
  end

  private
  def member_params
    params.permit(:name)
  end
end
