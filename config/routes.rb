Rails.application.routes.draw do
  get 'trades' => 'trades#index'
  get 'public_feed' => 'trades#public_feed'
  get 'logout' => 'login#logout'
  post 'login' => 'login#verify'
  post 'trades' => 'trades#add'
  post 'comments' => 'comments#write'
  post 'like/:id' => 'like#add'
  delete 'comments/:id' => 'comments#destroy'
  delete 'like/:id' => 'like#destroy'
  root 'login#index'
end
