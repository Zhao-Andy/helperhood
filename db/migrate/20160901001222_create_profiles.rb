class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :zipcode, limit: 5
      t.string :profile_img
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
