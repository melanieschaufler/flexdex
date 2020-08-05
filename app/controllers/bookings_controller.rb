class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookings, only: [:create, :destroy]

  # def show
  #   @workspace = Workspace.find(params[:workspace_id])
  #   @booking = current_user.booking
  # end

  def new
    @booking = Booking.new
    @workspace = Workspace.find(params[:workspace_id])
  end

  def create
     # I need to find the event that we're making a booking on
        # @workspace = Workspace.find(params[:workspace_id])
        # and because the event "has_many :bookings"
        @booking = @Booking.new(booking_params)
        # which person is booking the event
        @booking.user = current_user

        if @booking.save
        redirect_to bookings_path (@booking), notice: 'Your booking was successfully requested.'
        else
        render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, notice: 'Your booking was successfully cancelled.'
  end

  def my_bookings
    @bookings = policy_scope(Booking)
  end

private

def booking_params
  params.require(:booking).permit(:workspace_id)
end

end
