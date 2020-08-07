class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookings, only: [:show, :destroy]

  def my_bookings
    @my_bookings = Booking.where(user: current_user)
    authorize @my_bookings
  end

  def show
    @booking = current_user.booking
    @workspace = Workspace.find(params[:workspace_id])
  end

  def create
    # I need to find the event that we’re making a booking on
    @workspace = Workspace.find(params[:workspace_id])
    # and because the event “has_many :bookings”
    @booking = Booking.new(booking_params)
    @booking.workspace = @workspace
    # which person is booking the event
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to my_bookings_bookings_path, notice: 'Your booking was successfully requested.'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to my_bookings_bookings_path, notice: 'Your booking was successfully cancelled.'
  end

 def validation
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to new_workspace_path, notice: 'You accepted the booking'
  end

  def rejection
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "rejected"
    @booking.save
    redirect_to new_workspace_path, notice: 'You rejected the booking'
  end



  private
  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:workspace_id, :date)
  end

end

