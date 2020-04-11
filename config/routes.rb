Rails.application.routes.draw do
  root 'front#index'
   resources :items do
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
