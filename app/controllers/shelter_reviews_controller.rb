class ShelterReviewsController < ApplicationController
  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    new_review = ShelterReview.new(shelter_review_params)
    if new_review.save
      redirect_to("/shelters/#{params[:shelter_id]}")
    else
      flash[:notice] = "In order to leave a review, you must enter a title, rating, and description."
      redirect_to("/shelters/#{params[:shelter_id]}/reviews/new")
    end
  end

  def edit
  end 

  private

  def shelter_review_params
    params.permit(:title, :rating, :content, :image, :shelter_id)
  end
end
