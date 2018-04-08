class AddImagesToRecruits < ActiveRecord::Migration[5.1]
  def change
    add_column :recruits, :image, :text
  end
end
