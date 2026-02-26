class ReservationsController < ApplicationController
  before_action :require_login

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to reservations_path, notice: "予約が完了しました"
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  def index
    @reservations = current_user.reservations.includes(:room)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :people)
  end
end