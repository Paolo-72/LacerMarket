class Sale < ApplicationRecord
	#Richiamo funzione generate_guid
	before_create :generate_guid

	#Una vendita appartiene ad un contenuto specifico
	belongs_to :content

	#AASM per sicurezza transazioni e pagamenti
	include AASM
	#Controllo della colonna state sulla tabella Sales
	aasm column: 'state' do
		state :sleeping, initial: true
    	state :running 
    	state :completed
    	state :errored

    	#eventi per verifica passaggio da uno state all'altro
    	#sleeping to running
    	event :running, after: :charge_card do
    		transitions from: :sleeping, to: :running
    	end

    	#running to completed
    	event :complete do
    		transitions from: :running, to: :completed
    	end

    	#completed to errored
    	event :fail do
    		transitions from: :running, to: :errored
    	end 

	end

	def charge_card
		begin
			save!
			charge = Stripe::Charge.create(
				amount: self.amount,
				currency: "eur",
				card: self.stripe_token,
				description: "vendita di un contenuto"
				)
			self.update(stripe_id: charge.id)
			self.complete!

		rescue Stripe::StripeError => e
			self.update_attributes(error: e.message)
			self.fail!
		end
	end


	private

	#Funzione per la creazione del guid necessario alla vendita tramite la funzione Ruby SecureRandom.uuid()
	def generate_guid
		self.guid = SecureRandom.uuid()
	end
end
