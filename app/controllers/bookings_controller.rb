class BookingsController < ApplicationController
  def index
    @user_bookings = policy_scope(Booking)
    if current_user.admin
      @user_flats = policy_scope(Flat)
    end
  end

  # def show
  # end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to flats_path
    else
      render "flats/show"
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  def accept_booking
    @booking = Booking.find(params[:booking_id])
    @booking.status = true
    authorize @booking
    @booking.save
    redirect_to bookings_path
  end

  def decline_booking
    @booking = Booking.find(params[:booking_id])
    @booking.status = false
    authorize @booking
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_guests)
  end

end
