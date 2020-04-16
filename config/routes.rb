Rails.application.routes.draw do
  devise_for :users
  root 'front#index'
  resources :items, only: [:index,:new, :show, :create, :edit , :update, :destroy] do
    collection do
      get "buy"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
