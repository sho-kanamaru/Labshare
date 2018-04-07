class WorkersController < ApplicationController
  def index
    @recruits = Recruit.all
    user_ids = ClientRecruitRelation.getUserIdByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(user_ids)
  end
end
