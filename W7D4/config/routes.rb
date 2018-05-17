Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'home#pros'
  get '/hackers', to: 'home#hackers'
  get '/pros', to: 'home#pros'
  get 'lp1', to: 'home#lp1', as: 'lp1'
  get 'lp2', to: 'home#lp2', as: 'lp2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
