class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]


  def index

  end

  def show

  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    render :new unless @group.save
  end

  def update

  end

  def destroy
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end


    def group_params
      params.require(:group).permit(:name)
    end

end
