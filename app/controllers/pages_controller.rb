class PagesController < ApplicationController

  #definisco l'azione preventiva per la pagina di dashboard
  before_action :authenticate_user!, only: [:dashboard]

  #Definisco controller home
  def home
  end
  
  #Definisco controller about
  def about
  end

  #Definisco controller dashboard
  def dashboard
    
    #Variabile estrazione contenuti
    @content = current_user.contents

    #Variabile estrazione vendite per indirizzo mail
    @sales = Sale.where(email_venditore: current_user.email)

    #Variabile estrazione acquistato per indirizzo mail
    @purchased = Sale.where(email_acquirente: current_user.email)

  end

end
