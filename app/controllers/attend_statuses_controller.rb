class AttendStatusesController < ApplicationController

  def create
    attend_status = AttendStatus.find_or_create_by(user_id: current_user.id, event_id: params[:event_id])
    attend_status.update(attend: params[:attend])

    redirect_to event_path(params[:event_id])
  end

end
