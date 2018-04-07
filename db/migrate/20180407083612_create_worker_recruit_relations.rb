class CreateWorkerRecruitRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :worker_recruit_relations do |t|
      t.references :user, foreign_key: true
      t.references :recruit, foreign_key: true
      t.timestamps
    end
  end
end
