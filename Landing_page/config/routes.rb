Rails.application.routes.draw do
	root to: 'home#pros'
  get '/hackers', to: 'home#hackers'
  get '/pros', to: 'home#pros'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
