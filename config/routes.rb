Rails.application.routes.draw do
  root "profiles#show"

  devise_for :users
  get "admin/index", to: "admin#index"

  get "profile", to: "profiles#show"
  get "profile/edit", to: "profiles#edit", as: :edit_profile
  patch "profile", to: "profiles#update"

  resources :students
  resources :users, only: [ :index, :show ] do
    member do
      patch :make_admin
    end
  end
end
