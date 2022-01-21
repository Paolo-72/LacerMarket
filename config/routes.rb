Rails.application.routes.draw do
  resources :contents
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  #Imposto la pagina iniziale
  #get 'pages/home'
  root 'pages#home'

  #Imposto la pagina About
  get 'about' => 'pages#about'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  
end


