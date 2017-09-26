Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tweets#index"

  resources :tweets do
  	resources :likes
end

resources :tweets do
	resources :replies
end 


resources :users do
    member do
      get :following, :followers
    end
  end
  resources :follows, only: [:create, :destroy]


 get '/home' => 'tweets#home' # override default routes.
  get '/user/:id' => 'tweets#profile'
 

end
