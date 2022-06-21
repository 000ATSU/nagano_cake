Rails.application.routes.draw do


  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  get '/' => 'public/homes#top', as: 'root'
  get '/about' => 'public/homes#about'

  namespace :public do
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :create] do
      member do
        get 'destroy_all'
      end
    end
    resources :orders, only:[:new, :index, :show] do
      member do
        post 'confirmation'
        get 'completion'
      end
    end
    resources :customers, only:[:show, :edit, :update] do
      member do
        get 'confirmation'
        patch 'withdraw'
      end
    end
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only:[:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
