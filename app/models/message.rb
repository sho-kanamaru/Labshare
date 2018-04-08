class Message < ApplicationRecord
  belongs_to :recruit

  def self.getUnreadMessage(current_user_id)
    Message.where(to_id: current_user_id, read_flg: false)
  end
end
