Rails.application.routes.draw do
  root to: 'sectors#index'
  get 'homes/index'

  devise_for :admins 

  resources :admins do
    resources :photo_admins, only: [:create]
  end
  
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
