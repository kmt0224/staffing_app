class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def create
    @member = Member.create(member_params)
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to root_path
  end

  private
  def member_params
    params.permit(:name)
  end
end
