class CreateRecruits < ActiveRecord::Migration[5.1]
  def change
    create_table :recruits do |t|
      t.string :title, null: false
      t.references :field, foreign_key: true
      t.string :detail, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
