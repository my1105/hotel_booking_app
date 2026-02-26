class RoomsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :price, :address)
  end
end