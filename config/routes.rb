Rails.application.routes.draw do
  #Il comando get crea un link 'pages/home'
  #get 'pages/home'
  #Il comando root crea la pagina di riferimento(pages#home) impostando il controller pages e l'azione home
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
