class GroupMembersController < ApplicationController
  before_action :set_group, only: [:new, :create]
  before_action :authenticate_user!, only: [:new]

  def new
    render template: "groups/show" unless GroupMember.where(user_id: current_user.id).where(group_id: @group.id).blank?
  end

  def create
    GroupMember.create(user_id: current_user.id, group_id: @group.id) if params[:admission] === "true"
  end

  private
    def set_group
      @group = Group.find_by(token: params[:token])
    end

end
