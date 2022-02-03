class TransactionsController < ApplicationController
	
	#Ricerca del contenuto all'interno del database tramite il parametro slug friendly_id passato alla funzione Content.find_by!(slug: params[:slug])
	def create
		content = Content.find_by!(slug: params[:slug])

		sale = content.sales.create(
			amount: (content.price * 100).floor,
			email_acquirente: current_user.email,
			email_venditore: content.user.email,
			stripe_token: params[:stripeToken])
		sale.running!

		if sale.completed?
			redirect_to pickup_url(guid: sale.guid)

		else

	  		redirect_to content_path(content),notice: @error
	  	end

	end

	#Scarico del contenuto quando l'utente avrà completato il pagamento
	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@content = @sale.content
	end
end