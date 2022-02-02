class Sale < ApplicationRecord
	#Richiamo funzione generate_guid
	before_create :generate_guid

	#Una vendita appartiene ad un contenuto specifico
	belongs_to :content

	private

	#Funzione per la creazione del guid necessario alla vendita tramite la funzione Ruby SecureRandom.uuid()
	def generate_guid
		self.guid = SecureRandom.uuid()
	end
end
