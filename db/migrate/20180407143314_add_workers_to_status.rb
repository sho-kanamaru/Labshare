class AddWorkersToStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :worker_recruit_relations, :status, :integer, :default => 0
  end
end
