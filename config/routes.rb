Rails.application.routes.draw do
  get 'countries/index'
  get 'countries/show'
  get 'countries/new'
  get 'countries/create'
  get 'countries/edit'
  get 'countries/update'
  get 'countries/destroy'
  devise_for :admins
end
