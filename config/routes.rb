Rails.application.routes.draw do
  get 'photo_products/create'
  root to: 'sectors#index'
  get 'homes/index'

  devise_for :admins 

  resources :admins do
    get '/dashboard', to: 'admins#dashboard', as: 'dashboard'
    resources :companies do
      resources :products
    end

    resources :photo_admins, only: [:create]
  end

  resources :admins do
    resources :companies do
      resources :products
    end
  end
  
  resources :countries do
    resources :sectors
  end

  resources :countries, :sectors do
    resources :sub_sectors
  end

  resources :countries, :sectors, :sub_sectors do
    resources :companies
  end

  resources :countries, :sectors, :sub_sectors, :admins do
    resources :products
  end

  resources :products do
    resources :photo_products, only: [:create]
  end

  resources :companies

  get '/search' => 'companies#search', :as => 'search_companies'
end
