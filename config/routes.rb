Rails.application.routes.draw do

  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end


  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :users,only: [:show]
  resources :users,only: :logout, path: '' do
    collection do
      get 'logout'
    end
  end
  root 'items#index'
  get '/category/new'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "buy/:id" =>  'items#buy', as: 'buy'
      post 'pay/:id'=>   'items#pay', as: 'pay'
      get  'done'=>      'items#done', as: 'done'
      delete 'item/:id' =>  'items#destroy'
    end
    resources :comments, only:[:create,:update,:destroy]
  end
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
