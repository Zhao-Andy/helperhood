class ChangeAideTypesToResidentPrograms < ActiveRecord::Migration
  def change
    rename_table :aide_types, :resident_programs
    rename_table :user_programs, :nonprofit_programs
    rename_column :profiles, :profile_img, :photo
    add_column :programs, :visits, :integer
    add_column :programs, :photo, :string
    remove_column :resident_programs, :donation, :string

    create_table :donations do |t|
      t.integer :user_id
      t.integer :program_id
      t.decimal :donation_amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
