class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.decimal :donation_goal, precision: 10, scale: 2
      t.decimal :total_donated, precision: 10, scale: 2
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
