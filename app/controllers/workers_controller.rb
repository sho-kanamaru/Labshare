class WorkersController < ApplicationController
  include WorkersHelper

  def index
    @recruits = get_recruits
    users = @recruits.map{|recruit| recruit.users.first}
    @rank = Rank.clientRankAverage(users)

    @messages = Message.where(to_id: current_user)
  end

  def show
    @user = current_user
    @recruits = Recruit.getAppliedRecruitList(current_user.id)
    user_ids = ClientRecruitRelation.getUserByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(user_ids)
  end
end
