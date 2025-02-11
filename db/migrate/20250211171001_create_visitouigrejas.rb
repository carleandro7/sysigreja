class CreateVisitouigrejas < ActiveRecord::Migration[7.1]
  def change
    create_table :visitouigrejas do |t|
      t.references :igreja, null: false, foreign_key: true
      t.references :visitaigreja, null: false, foreign_key: true
      t.date :data
      t.string :descricao

      t.timestamps
    end
  end
end
