class Content < ApplicationRecord

	#Friendly_Id
	extend FriendlyId
  	friendly_id :titolo, use: :slugged

	#Ogni contenuto appartiene ad un solo utente
	belongs_to :user

	#Ogni contenuto può essere venduto più volte
	has_many :sales

	#Validazione titolo,descrizione e prezzo su inserisci nuovi contenuti
	validates :titolo, :descrizione, :price, presence: true

	#Validazione formato prezzo su inserisci nuovi contenuti il sistema Stripe utilizzato per il pagamento accetta transazioni superiori a 50 cents
	validates :price, numericality: { greater_than: 0.49 }
	
	#Ogni contenuto ha solo un'immagine
	has_one_attached :cover
	
	#Ogni contenuto ha solo un allegato
	has_one_attached :allegato

	#validazione tipo file immagine
	validate :tipo_file_immagine

	#validazione tipo file allegato
	validate :tipo_allegato

	private

	def tipo_file_immagine
		if cover.attached? && !cover.content_type.in?(%w(image/jpeg image/png image/gif))
			errors.add(:cover,'il file deve essere tipo jpeg,png oppure gif')
			else if cover.attached? == false
				errors.add(:cover,'Inserisci un file di immagine!!')
			end			
		end
	end

	def tipo_allegato
		if allegato.attached? && !allegato.content_type.in?(%w(application/msword application/pdf application/vnd.ms-excel application/vnd.ms-powerpoint application/vnd.oasis.opendocument.text application/vnd.openxmlformats-officedocument.presentationml.presentation application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.openxmlformats-officedocument.wordprocessingml.document application/zip audio/mpeg audio/mp3 audio/mp4))
			errors.add(:allegato,'il file deve essere tipo office-aut.,PDF, ZIP, AUDIO')			
		end
	end
end
