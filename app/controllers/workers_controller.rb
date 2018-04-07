class WorkersController < ApplicationController
  def index
    @recruits = Recruit.all
    user_ids = ClientRecruitRelation.getUserIdByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(user_ids)
  end

  def show
    @user = current_user
    @recruits = Recruit.getAppliedRecruitList(current_user.id)
    user_ids = ClientRecruitRelation.getUserIdByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(user_ids)
  end
end
