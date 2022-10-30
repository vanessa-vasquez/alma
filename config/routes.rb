Rottenpotatoes::Application.routes.draw do
  root to: 'dashboard#index'

  resources :users do
    collection do
      get 'login'
    end
  end
  resources :tasks do
    collection do
      get 'my_tasks'
    end
  end 
end
