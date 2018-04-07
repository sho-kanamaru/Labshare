class WorkersController < ApplicationController
  def index
    user_id = current_user.id
    @recruits = Recruit.all
    user_ids = ClientRecruitRelation.getUserIdByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(user_ids)
  end
end
