Rails.application.routes.draw do
  resources :contents do
    member { get :delete }
  end

  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  delete '/contents/:id/delete', to: 'contents#destroy'

  
  end

  #Imposto la pagina iniziale
  #get 'pages/home'
  root 'pages#home'

  #Imposto la pagina About
  get 'about' => 'pages#about'

  #Imposto route azioni di riferimento 'compra e pickup'
  post '/compra/:slug', to: 'transactions#create',as: :compra
  get '/pickup/:guid', to: 'transactions#pickup', as: :pickup

  #Imposto azione per dashboard
  get 'dashboard' => 'pages#dashboard'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  
end


