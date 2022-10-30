Rottenpotatoes::Application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users

  resources :tasks do
    collection do
      get 'my_tasks'
    end
  end 
end
