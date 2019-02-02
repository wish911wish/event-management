class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = EventDecorator.where('end_time >= ?', Time.now).order("start_time ASC").page(params[:page]).per(10).decorate
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
    @event = Event.new(event_params)
    render :new unless @event.save
  end

  def update
    @event.update(event_params) if @event.user_id === current_user.id
  end

  def destroy
    @event.destroy if @event.user_id === current_user.id
  end

  def search
    @events = EventDecorator.where('end_time >= ?', params[:serch_date]).where('start_time <= ?', params[:serch_date]).order("start_time ASC").page(params[:page]).per(10).decorate

    # Ajax化の廃止
    # @event_list = render_to_string(
    #   partial: 'events',
    #   locals: { events: @events }
    # )

    # @paginator = view_context.paginate(
    #   @events,
    #   remote: true,
    #   url: "/events/search",
    # )

    respond_to do |format|
      format.json { }
      format.html { render :index }
      format.js { }
    end
  end

  private
    def set_event
      @event = EventDecorator.find(params[:id]).decorate
    end

    def event_params
      params.require(:event).permit(:name, :place ,:comment , :start_time, :end_time, :group_id).merge(user_id: current_user.id)
    end

    def serch_params
      params.permit(:serch_date)
    end

end
