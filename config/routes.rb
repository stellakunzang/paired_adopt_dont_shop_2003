Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'shelters#index'
  get '/shelters/', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: "shelters#show"
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  get '/pets/:id', to: 'pets#show'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'
  patch '/pets/:id/adopt', to: 'pets#adopt_update'

  get '/favorites', to: 'favorites#index'
  patch '/favorites/:pet_id', to: 'favorites#update'
  delete '/favorites/:pet_id', to: 'favorites#destroy'

  get '/shelters/:shelter_id/reviews/new', to: 'shelter_reviews#new'
  post '/shelters/:shelter_id', to: 'shelter_reviews#create'
  get '/shelters/:shelter_id/reviews/:review_id/edit', to: 'shelter_reviews#edit'
  patch '/shelters/:shelter_id/reviews/:review_id', to: 'shelter_reviews#update'
  delete '/shelters/:shelter_id/reviews/:review_id', to: 'shelter_reviews#destroy'

  get '/adoption_applications/new', to: 'adoption_application#new'
  post '/favorites', to: 'adoption_application#create'
  get '/adoption_applications/:id', to: 'adoption_application#show'
end
