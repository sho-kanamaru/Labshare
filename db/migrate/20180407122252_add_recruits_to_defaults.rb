class AddRecruitsToDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column :recruits, :status, :integer, :default => 0
  end
end
