class CreateIgrejas < ActiveRecord::Migration[7.1]
  def change
    create_table :igrejas do |t|
      t.string :nome
      t.references :distrito, null: false, foreign_key: true

      t.timestamps
    end
  end
end
