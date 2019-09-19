Rails.application.routes.draw do
  get 'homes/index'
  devise_for :admins
  root to: 'sectors#index'

  resources :countries do
    resources :sectors
  end

  resources :countries, :sectors do
    resources :sub_sectors
  end

  resources :countries, :sectors, :sub_sectors, :admins do
    resources :companies
  end

  resources :countries, :sectors, :sub_sectors, :admins, :companies do
    resources :products
  end

  resources :products
  
  get '/search' => 'companies#search', :as => 'search_companies'
end
