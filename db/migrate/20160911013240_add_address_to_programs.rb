class AddAddressToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :address, :string
    add_column :programs, :zipcode, :integer, limit: 8
  end
end
