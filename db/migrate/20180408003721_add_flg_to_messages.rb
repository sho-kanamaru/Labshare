class AddFlgToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :read_flg, :boolean, default: false, null: false
  end
end
