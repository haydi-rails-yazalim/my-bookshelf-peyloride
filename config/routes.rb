Rails.application.routes.draw do
  root 'book_lists#index'

  devise_for :users
  resources :book_lists,  :except => [:new, :edit]
  post '/book_lists/add_to_profile', to: 'book_lists#add_to_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
