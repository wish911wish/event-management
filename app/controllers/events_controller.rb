class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.order("updated_at DESC")
  end

  def show
    @participants = @event.attend_statuses.where('attend = ?', 1).includes(:user).order("updated_at DESC")
    @absentees = @event.attend_statuses.where('attend = ?', 2).includes(:user).order("updated_at DESC")
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    binding.pry
    @event = Event.new(event_params)
    binding.pry
    render :new unless @event.save
  end

  def update
    @event.update(event_params) if @event.user_id == current_user.id
  end

  def destroy
    @event.destroy if @event.user_id == current_user.id
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :place ,:comment , :start_time, :end_time).merge(user_id: current_user.id)
    end
end
