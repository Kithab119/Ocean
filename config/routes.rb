Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :creators, skip: [:passwords], controllers: {
    registrations: "creator/registrations",
    sessions: "creator/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }

  scope module: :customer do
    root to: "homes#top"
    resources :creators, only: [:index, :show]
    resources :items, only: [:index, :show]
    get "/customers/out" => "customers#out"
    patch "/customers/out_check" => "customers#out_check"
    resource :customers, only: [:show, :edit, :update]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:create, :index, :update, :destroy]
    post "orders/order_check" => "orders#check"
    get "orders/order_finish" => "orders#order_finish"
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :makings, only: [:new, :create, :index, :show]
  end

  namespace :creator do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :items
    get "/creators/out" => "creators#out"
    patch "/creators/out_check" => "creators#out_check"
    resources :creators, only: [:show, :edit, :update]
    resources :makings, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :creators, only: [:show, :edit, :update]
    resources :colors, only: [:create, :index, :edit, :update]
    resources :sizes, only: [:create, :index, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :styles, only: [:create, :index, :edit, :update]
    resources :orders , only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
