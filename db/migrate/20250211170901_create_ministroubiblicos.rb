class CreateMinistroubiblicos < ActiveRecord::Migration[7.1]
  def change
    create_table :ministroubiblicos do |t|
      t.string :conteudo
      t.date :data
      t.references :visitaigreja, null: false, foreign_key: true
      t.references :visitabiblico, null: false, foreign_key: true
      t.references :estudobiblico, null: false, foreign_key: true
      t.references :itemestudobiblico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
