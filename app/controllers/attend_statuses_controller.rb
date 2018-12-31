class AttendStatusesController < ApplicationController

  def create
    @attend_status = AttendStatus.find_or_create_by(user_id: current_user.id, event_id: params[:event_id])
    @attend_status.update(attend: params[:attend])

    respond_to do |format|
      format.json { }
      format.html { redirect_to event_path(params[:event_id]) }

    # respond_to do |format|
    #   format.html { redirect_to event_path(params[:event_id]) }
    #   format.json { }
    end
  end

end
