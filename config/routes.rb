Rails.application.routes.draw do
  get 'trades/index'
  get 'login/logout'
  post 'login/verify'
  post 'trades/add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'login#index'
end
