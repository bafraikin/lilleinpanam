class AddBooleanToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscribe, :boolean
  end
end
