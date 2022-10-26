class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :name, null: false, index: true, foreign_key: { to_table: :users }
      t.string :name
      t.string :measurment_unit
      t.decimal :price
      t.integer  :quantity
      t.timestamps
    end
  end
end
