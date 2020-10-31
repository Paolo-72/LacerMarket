class ApplicationController < ActionController::Base
	#Permesso di inserire un nuovo campo nell'applicazione
	before_action :configure_permitted_parameters, if: :devise_controller?

	# Configurazione che permette l'aggiunta di un parametro nella pagina di sign_up
	protected

  def configure_permitted_parameters
    #Aggiunta del parametro nome
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #Modifica dell'account dopo essersi registrato
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])	
  end

end
