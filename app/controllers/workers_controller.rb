class WorkersController < ApplicationController
  def index
    @recruits = Recruit.all
    users = ClientRecruitRelation.getUserByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(users)
  end
end
