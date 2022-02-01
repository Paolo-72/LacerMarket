class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Un utente può avere più contenuti
  has_many :contents

  #Validazione nome in fase di registrazione
  validates :name, presence: true

end
