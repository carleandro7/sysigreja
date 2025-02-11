class CreateItemestudobiblicos < ActiveRecord::Migration[7.1]
  def change
    create_table :itemestudobiblicos do |t|
      t.string :descricao
      t.references :estudobiblico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
