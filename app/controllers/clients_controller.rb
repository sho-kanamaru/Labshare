class ClientsController < ApplicationController
  def index
    user_id = current_user.id
    @recruits = Recruit.getMyRecruitList(user_id)
    @ranks = Rank.getRecruitRankAverage(user_id,@recruits)
  end
end
