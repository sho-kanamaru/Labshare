class CreateRanks < ActiveRecord::Migration[5.1]
  def change
    create_table :ranks do |t|
      t.references :field, foreign_key: true
      t.integer :rank
      t.integer :from_id
      t.integer :to_id
      t.timestamps
    end
  end
end
