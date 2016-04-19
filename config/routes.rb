Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  get "/about" => "home#about"

  match 'jobs/update_note' => 'jobs#update_note', :via => [:post]

  resources :jobs
end
