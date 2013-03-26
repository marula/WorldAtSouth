Worldatsouth::Application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  get "songs/admin"
  get "pictures/admin"
  get "galleries/admin"
  get "videos/admin"
  get "gigs/admin"

  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/admin', :to => 'pages#admin'
  
  root :to => 'gigs#index'

  resources :users, :sessions, :gigs, :songs, :videos

  resources :galleries do
    resources :pictures
  end

  match '*path' => redirect('/')
end
