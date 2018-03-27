Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: { registrations: 'registrations' }

  resources :assignments
end
