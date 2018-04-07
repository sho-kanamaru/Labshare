class AddFieldIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :field_id, :integer
  end
end
