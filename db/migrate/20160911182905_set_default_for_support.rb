class SetDefaultForSupport < ActiveRecord::Migration
  def change
    rename_column :aide_types, :support, :support_status
    change_column :aide_types, :support_status, :boolean, default: false
  end
end
