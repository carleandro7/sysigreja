class CreateVisita < ActiveRecord::Migration[7.1]
  def change
    create_table :visita do |t|
      t.string :nome
      t.string :apelido
      t.string :telefone
      t.integer :whatsapp_telefone
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :latitude
      t.string :longitude
      t.references :igreja, null: false, foreign_key: true

      t.timestamps
    end
  end
end
