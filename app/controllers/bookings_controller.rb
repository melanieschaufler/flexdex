class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookings, only: [:show, :destroy]
  def show
    @booking = current_user.booking
    @workspace = Workspace.find(params[:workspace_id])
  end

  def create
    # I need to find the event that we're making a booking on
    @workspace = Workspace.find(params[:workspace_id])
    # and because the event "has_many :bookings"
    @booking = Booking.new(booking_params)
    @booking.workspace = @workspace
    # which person is booking the event
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to workspaces_path(@workspace), notice: 'Your booking was successfully requested.'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, notice: 'Your booking was successfully cancelled.'
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:workspace_id)
  end
end
