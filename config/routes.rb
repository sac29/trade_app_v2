Rails.application.routes.draw do
  get 'trades/index'
  get 'trades/public_feed'
  get 'login/logout'
  post 'login/verify'
  post 'trades/add'
  post 'comments/write'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'login#index'
end

# Rails.application.routes.draw do
#   get 'trades' => 'trades#index'
#   get 'trades/public_feed' => 'trades#public_feed'
#   get 'logout'
#   post 'login'
#   post 'trades'
#   post 'comments'
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   root 'login#index'
# end
