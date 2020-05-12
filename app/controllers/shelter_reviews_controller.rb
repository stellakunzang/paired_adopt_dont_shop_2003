class ShelterReviewsController < ApplicationController
  def new
    @shelter_id = params[:shelter_id]
  end
  
end
