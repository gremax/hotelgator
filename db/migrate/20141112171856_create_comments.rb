class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :hotel, index: true
      t.references :user, index: true
      t.string :rating
      t.text :text

      t.timestamps
    end
  end
end
