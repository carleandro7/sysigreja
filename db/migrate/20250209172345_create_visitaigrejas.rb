class CreateVisitaigrejas < ActiveRecord::Migration[7.1]
  def change
    create_table :visitaigrejas do |t|
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
      t.text :observacao
      t.date :data_nasc
      t.references :igreja, null: false, foreign_key: true

      t.timestamps
    end
  end
end
