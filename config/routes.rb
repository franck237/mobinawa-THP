Rails.application.routes.draw do
  get 'homes/index'
  devise_for :admins
  root to: 'sectors#index'

  resources :admins do
    resources :companies do
      resources :products
    end
  end

  resources :sectors do
    resources :companies do
      resources :products
    end
  end

  resources :companies
  resources :sectors
  get '/search' => 'companies#search', :as => 'search_companies'
end
