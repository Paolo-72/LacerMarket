#File di migrazione per aggiungere al database il campo Nome generato dal terminal 
#tramite comando rails g(generate) migration Add_Nome_To_Users name:string.
#Per modificare il database lanciare da riga di comando rake db:migrate 

class AddNomeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
  end
end
