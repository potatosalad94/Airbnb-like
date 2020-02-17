class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @review = Review.new(review_params)
    @flat = Flat.find(params[:flat_id])
    authorize @review
    @review.user = current_user
    @review.flat = @flat
    if @review.save
      redirect_to flat_path(@flat)
    else
      render 'flats/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
