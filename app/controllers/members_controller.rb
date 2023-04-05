class MembersController < ApplicationController
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
end
