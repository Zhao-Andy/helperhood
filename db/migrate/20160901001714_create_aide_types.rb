class CreateAideTypes < ActiveRecord::Migration
  def change
    create_table :aide_types do |t|
      t.integer :user_id
      t.integer :program_id
      t.boolean :volunteer, default: false
      t.decimal :donation, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
