Rails.application.routes.draw do
  resources :products
  root 'products#index'
  get 'products/:id/add_details',    to: 'products#add_details',    as: 'add_details_product'
  get 'products/:id/remove_details', to: 'products#remove_details', as: 'remove_details_product'
end
