Rails.application.routes.draw do
  get 'rails/destroy'

  get 'rails/controller'

  get '/category/new'

  root 'front#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
