class AttendStatusesController < ApplicationController
  before_action :set_event, only: [:edit]

  def edit
    @participants = @event.attend_statuses.where('attend = ?', 1).includes(:user).order("updated_at DESC")
    @absentees = @event.attend_statuses.where('attend = ?', 2).includes(:user).order("updated_at DESC")
  end

  def create
    @attend_status = AttendStatus.find_or_create_by(user_id: current_user.id, event_id: params[:event_id])

    @attend_status.update(attend: params[:attend])

    respond_to do |format|
      format.json { }
      format.html { redirect_to event_path(params[:event_id]) }
    end
  end

  private
    def set_event
      @event = Event.find_by(token: params[:token])
    end
end
