class ShelterReviewsController < ApplicationController
  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    ShelterReview.create(shelter_review_params)
    redirect_to("/shelters/#{params[:shelter_id]}")
  end

  private

  def shelter_review_params
    params.permit(:title, :rating, :content, :image, :shelter_id)
  end
end
