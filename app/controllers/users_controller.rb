class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @created_events = Event.where('user_id = ?', current_user.id).order("updated_at DESC").page(params[:page]).per(10)
    @attendance_events = current_user.events.order("updated_at DESC").page(params[:page]).per(10)
    @groups = current_user.groups
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
