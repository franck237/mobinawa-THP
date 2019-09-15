Rails.application.routes.draw do
  devise_for :admins
  root to: 'sectors#index'

  resources :admins do
    resources :compagnies
  end

  resources :sectors do
    resources :sub_sectors do
      resources :compagnies do
      resources :products
      end
    end
  end
end
