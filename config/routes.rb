Rails.application.routes.draw do
  devise_for :admins
  root to: 'sectors#index'

  resources :admins do
    resources :companies do
      resources :products
    end
  end

  resources :countries do
    resources :sectors do
      resources :sub_sectors do
        resources :companies do
        resources :products
        end
      end
    end
  end

end
