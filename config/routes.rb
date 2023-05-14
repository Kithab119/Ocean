Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :creator, skip: [:passwords], controllers: {
    registrations: "creator/registrations",
    sessions: "creator/sessions"
  }

  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }

  scope module: :customer do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :creators, only: [:index, :show, :update] do
      resources :makings, only: [:new, :create]
      resources :reviews, only: [:new, :create]
    end
    resources :makings, only: [:index, :show]
    resources :items, only: [:index, :show]
    get "/customers/out" => "customers#out"
    patch "/customers/out_check" => "customers#out_check"
    resource :customers, only: [:show, :edit, :update]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:create, :index, :destroy]
    post "orders/order_check" => "orders#order_check"
    get "orders/order_finish" => "orders#order_finish"
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :follows, only: [:create, :index]
  end

  namespace :creator do
    root to: "homes#top"
    resources :items
    get "/creators/out" => "creators#out"
    patch "/creators/out_check" => "creators#out_check"
    resource :creators, only: [:show, :edit, :update]
    get "/makings" => "makings#index", as: "creators_makings"
    resources :makings, only: [:show, :update]
  end

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :creators, only: [:show, :edit, :update]
    resources :colors, only: [:create, :index, :destroy]
    resources :sizes, only: [:create, :index, :destroy]
    resources :genres, only: [:create, :index, :destroy]
    resources :styles, only: [:create, :index, :destroy]
    resources :orders , only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
