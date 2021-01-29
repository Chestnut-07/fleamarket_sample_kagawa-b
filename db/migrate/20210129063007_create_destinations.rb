class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :post_code, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :@hone_number
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
