class CreateCabeches < ActiveRecord::Migration[7.1]
  def change
    create_table :cabeches do |t|
      t.string :address
      t.string :name
      t.integer :price_per_minute
      t.string :description
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
