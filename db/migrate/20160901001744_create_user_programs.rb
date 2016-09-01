class CreateUserPrograms < ActiveRecord::Migration
  def change
    create_table :user_programs do |t|
      t.integer :program_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
