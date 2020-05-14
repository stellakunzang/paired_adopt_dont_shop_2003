class ShelterReviewsController < ApplicationController
  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    new_review = ShelterReview.new(review_params)
    if new_review.save
      redirect_to("/shelters/#{params[:shelter_id]}")
    else
      flash[:notice] = "In order to leave a review, you must enter a title, rating, and description."
      redirect_to("/shelters/#{params[:shelter_id]}/reviews/new")
    end
  end

  def edit
    @review = ShelterReview.find(params[:review_id])
    @shelter_id = params[:shelter_id]
  end

  def update
    review = ShelterReview.find(params[:review_id])
    review.update(review_params)
    if review.save
      redirect_to "/shelters/#{review.shelter_id}"
    else
      flash[:notice] = "In order to edit a review, you must enter a title, rating, and description."
      redirect_to("/shelters/#{review.shelter_id}/reviews/#{review.id}/edit")
    end
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :image, :shelter_id)
  end
end
