Rails.application.routes.draw do
  get 'sectors/index'
  get 'sectors/show'
  get 'sectors/new'
  get 'sectors/create'
  get 'sectors/edit'
  get 'sectors/update'
  get 'sectors/destroy'
  get 'countries/index'
  get 'countries/show'
  get 'countries/new'
  get 'countries/create'
  get 'countries/edit'
  get 'countries/update'
  get 'countries/destroy'
  devise_for :admins
end
