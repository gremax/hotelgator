class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.integer :rating
      t.boolean :breakfast
      t.text :room_description
      t.integer :price
      t.references :address, index: true
      t.references :user, index: true

      t.timestamps
    end
    add_index :hotels, :title
  end
end
