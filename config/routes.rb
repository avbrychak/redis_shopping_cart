Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :discount_campaigns
  resources :discounts
  resources :products, only: [:show, :index]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'increase_count/:product_id', to: 'carts#increase_count', as: :increase_count_in
    put 'decrease_count/:product_id', to: 'carts#decrease_count', as: :decrease_count_in
  end

  root to: 'products#index'
end
