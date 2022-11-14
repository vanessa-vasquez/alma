Rottenpotatoes::Application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :tasks do
    collection do
      get 'my_profile'
      get 'delete_all'
      get 'accept'
      get 'delete_accepted'
      get 'completed'
    end
  end 
end
