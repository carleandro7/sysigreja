class CreateMinistroubiblicousers < ActiveRecord::Migration[7.1]
  def change
    create_table :ministroubiblicousers do |t|
      t.references :ministroubiblico, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
