class Message < ApplicationRecord
  belongs_to :recruit

  def self.getUnreadMessage(current_user)
    if current_user.nil?
      return nil
    else
      return Message.where(to_id: current_user.id, read_flg: false)
    end
  end
end
