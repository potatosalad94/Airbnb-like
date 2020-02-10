class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_flat, only: [:show]

  def index
    @flats = policy_scope(Flat)
    @search = params[:search]
    if @search.present?
      @flats = policy_scope(Flat).where("city ILIKE ?", "%#{@search}%")
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.all
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :city, :address, :price_in_cents, :max_guests, :photo)
  end
end
