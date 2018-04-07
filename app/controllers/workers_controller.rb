class WorkersController < ApplicationController
  def index
    user_id = current_user.id
    @rank = Rank.clientRankAverage(user_id)
    @recruits = Recruit.all
  end
end
