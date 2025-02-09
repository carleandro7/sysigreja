class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.integer :tipo
      t.string :telefone
      t.references :igreja, null: false, foreign_key: true

      t.timestamps
    end
  end
end
