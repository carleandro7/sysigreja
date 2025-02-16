class CreateEstudoministrados < ActiveRecord::Migration[7.1]
  def change
    create_table :estudoministrados do |t|
      t.references :ministroubiblico, null: false, foreign_key: true
      t.references :visitaigreja, null: false, foreign_key: true

      t.timestamps
    end
  end
end
