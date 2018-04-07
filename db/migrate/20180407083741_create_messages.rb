class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.bigint :from_id
      t.bigint :to_id
      t.string :body
      t.references :recruit, foreign_key: true
      t.timestamps
    end
    add_foreign_key :messages, :users, column: :from_id
    add_foreign_key :messages, :users, column: :to_id
  end
end
