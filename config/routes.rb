Rottenpotatoes::Application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :tasks do
    collection do
      get 'my_profile'
    end
  end 

end
