Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: { registrations: 'registrations' }
  get '/users', to: 'users#index'

  resources :assignments do
    resources :essays, except: [:edit, :update] do
      resources :comments, only: [:create]
    end
  end
end
