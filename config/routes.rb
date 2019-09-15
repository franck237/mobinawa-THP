Rails.application.routes.draw do
  get 'companies/index'
  get 'companies/show'
  get 'companies/new'
  get 'companies/create'
  get 'companies/edit'
  get 'companies/update'
  get 'companies/destroy'
  get 'admins/index'
  get 'admins/show'
  get 'admins/new'
  get 'admins/create'
  get 'admins/edit'
  get 'admins/update'
  get 'admins/destroy'
  get 'sub_sectors/index'
  get 'sub_sectors/show'
  get 'sub_sectors/new'
  get 'sub_sectors/create'
  get 'sub_sectors/edit'
  get 'sub_sectors/update'
  get 'sub_sectors/destroy'
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
