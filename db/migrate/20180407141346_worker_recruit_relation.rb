class WorkerRecruitRelation < ActiveRecord::Migration[5.1]
  def change
    add_column :worker_recruit_relations, :status, :integer
  end
end
