Rails.application.routes.draw do

  get '/' => 'public/homes#top', as: 'root'
  get '/about' => 'public/homes#about'

  namespace :public do
    resources :cart_items, only:[:index, :update, :destroy, :destroy_all, :create]
    resources :items, only:[:index, :show]
    resources :orders, only:[:new, :confirmation, :completion, :index, :show]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only:[:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
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
