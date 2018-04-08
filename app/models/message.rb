class Message < ApplicationRecord
  belongs_to :recruit

  def self.getUnreadMessage(current_user)
    if current_user.nil?
      return nil
    else
      return Message.where(to_id: current_user.id, read_flg: false).group(:recruit_id)
    end
  end

  # @applied_users = WorkerRecruitRelation.where(recruit_id: params[:id])
  #
  # @user = current_user
  # applied_users = @applied_users.map{ |user| User.find(user.user_id)}

  def self.getUnreadMessageWorker(current_user)
    if current_user.nil?
      return nil
    else
      # unreadMessages = getUnreadMessage(current_user).count()
      # client = getUnreadMessageClient(current_user)
      # if(unreadMessages.nil?)
      #   return 0
      # else
      #   return unreadMessages - client
      # end
      return 0
    end
  end

  def self.getUnreadMessageClient(current_user)
    if current_user.nil?
      return nil
    else
      unreadRecruits = Message.getUnreadMessage(current_user).group(:recruit_id).select(:recruit_id)
      if unreadRecruits.present?
        users_id = Recruit.where(id: unreadRecruits).map{|recruit| recruit.users.first.id}
        return myRecruits = users_id.count(current_user.id)
      else
        return 0
      end
    end
  end
end
