Rails.application.routes.draw do
  devise_for :users 
  resources :lists do
    resources :items
  end 

  root "welcome#index"

end
