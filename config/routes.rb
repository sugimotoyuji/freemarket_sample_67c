Rails.application.routes.draw do
  
  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end


  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :users,only: [:show]
  resources :users,only: :logout, path: '' do
    collection do
      get 'logout'
      get 'like'
      get "users/:id/likes" => "users#likes"
    end
  end
  root 'items#index'
  get '/category/new'
  resources :items do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    
    collection do
      get 'search'
      get 'detail_search'
      get 'get_category_parents', defaults: { format: 'json' } 
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "buy/:id" =>  'items#buy', as: 'buy'
      post 'pay/:id'=>   'items#pay', as: 'pay'
      get  'done'=>      'items#done', as: 'done'
      delete 'item/:id' =>  'items#destroy'
      post   '/like/:item_id' => 'likes#create',   as: 'create'
      delete '/like/:item_id' => 'likes#destroy', as: 'destroy'
    end
    member do
      get 'category_index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
