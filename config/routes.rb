Rails.application.routes.draw do
  resources :assignments
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  root 'welcome#index'
end
