class CreateMinistroubiblicos < ActiveRecord::Migration[7.1]
  def change
    create_table :ministroubiblicos do |t|
      t.string :conteudo
      t.date :data
      t.references :estudobiblico, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :itemestudobiblico, null: true, foreign_key: true
      t.references :igreja, null: false, foreign_key: true

      t.timestamps
    end
  end
end
