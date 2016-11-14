Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root "static_pages#home"
  get "static_pages/help"
  resources :projects

  namespace :admin do
    root "static_pages#home"
    resources :workspaces
    resources :users
  end
end
