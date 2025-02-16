class CreateVisitabiblicos < ActiveRecord::Migration[7.1]
  def change
    create_table :visitabiblicos do |t|
      t.references :visitaigreja, null: false, foreign_key: true
      t.references :estudobiblico, null: false, foreign_key: true
      t.references :igreja, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim
      t.text :descricao

      t.timestamps
    end
  end
end
