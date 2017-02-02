Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :book_lists
  post '/book_lists/add_to_profile', to: 'book_lists#add_to_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
