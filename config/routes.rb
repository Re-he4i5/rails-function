Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :customer, controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }


  # ゲストログイン用
  devise_scope :customer do
    post 'customers/guest_sign_in' => 'customers/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :books
  resources :events
end
