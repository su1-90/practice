Rails.application.routes.draw do
  # Deviseのルーティングを設定
  devise_for :users
    
  devise_scope :user do
    root "devise/sessions#new"
  end

  resources :tasks
  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # ユーザー編集ページへのルーティングを追加
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user_profile'
end