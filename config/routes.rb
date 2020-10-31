Rails.application.routes.draw do
  devise_for :users
  #Il comando get crea un link 'pages/home'
  #get 'pages/home'
  #Il comando root crea la pagina di riferimento(pages#home) impostando il controller pages e l'azione home
  root 'pages#home'
  #Il comando get crea il link per la pagina di about nel controller pages azione home
  get 'about' => 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
