Rails.application.routes.draw do
  devise_for :users
  root 'front#index'
   resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "buy"
    end
   end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
