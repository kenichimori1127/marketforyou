Rails.application.routes.draw do
  root to: "pages#index"

  # ユーザー
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, :only => [:show, :index]

  # スタッフ
  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }

  resources :staffs, :only => [:show, :index]

  # フォロー
  resources :relationships, :only => [:create, :destroy]
end
