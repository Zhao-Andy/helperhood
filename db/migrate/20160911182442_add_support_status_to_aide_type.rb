class AddSupportStatusToAideType < ActiveRecord::Migration
  def change
    add_column :aide_types, :support, :boolean
  end
end
