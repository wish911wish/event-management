class UsersController < ApplicationController
  def show
    @created_events = Event.where('user_id = ?', current_user.id).order("updated_at DESC").page(params[:page]).per(10)
    @attendance_events = current_user.events.order("updated_at DESC").page(params[:page]).per(10)
    @groups = current_user.groups
  end
end
