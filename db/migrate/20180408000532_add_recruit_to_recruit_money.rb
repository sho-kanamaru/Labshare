class AddRecruitToRecruitMoney < ActiveRecord::Migration[5.1]
  def change
    add_column :recruits, :recruit_money, :integer, :default => 0
  end
end
