Rails.application.routes.draw do
  devise_for :users
  #Imposto la pagina iniziale
  #get 'pages/home'
  root 'pages#home'

  #Imposto la pagina About
  get 'about' => 'pages#about'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
