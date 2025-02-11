class CreateEstudobiblicos < ActiveRecord::Migration[7.1]
  def change
    create_table :estudobiblicos do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
