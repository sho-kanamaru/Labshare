class ClientsController < ApplicationController
  def index
    user_id = current_user.id
    @recruits = Recruit.getMyRecruitList(user_id)
    binding.pry
    @ranks = Rank.getRecruitRankAverage(user_id,@recruits)
    binding.pry
    @message_count = Message.where(to_id: current_user)
  end
end
