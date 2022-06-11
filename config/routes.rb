Rails.application.routes.draw do

  namespace :public do
    root to: 'homes#top'
  end
  namespace :admin do
    get '/' => 'homes#top'
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
