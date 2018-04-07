class CreateUserFields < ActiveRecord::Migration[5.1]
  def change
    create_table :user_fields do |t|
      t.references :user, foreign_key: true
      t.references :field, foreign_key: true
      t.timestamps
    end
  end
end
