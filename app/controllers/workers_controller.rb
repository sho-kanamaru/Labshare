class WorkersController < ApplicationController
  include WorkersHelper

  def index
    recruits = get_recruits
    @recruits = recruits.where.not(status: 2)
    users = @recruits.map{|recruit| recruit.users.first}
    @fields = Field.all
    @url = "/workers/search"
    @rank = Rank.clientRankAverage(users)
    @rank_sum = Rank.clientRankAS(users)
    @messages = Message.where(to_id: current_user)
  end

  def show
    @fields = Field.all
    @user = current_user
    @recruits = Recruit.getAppliedRecruitList(current_user.id)
    user_ids = ClientRecruitRelation.getUserByRecruitId(@recruits)
    @rank = Rank.clientRankAverageC(user_ids)
    @rank_sum = Rank.getRankSums(user_ids)
  end

  def search
    @fields = Field.all
    @field = params[:field_id]
    @query = params[:query]
    @url = "/workers/search"
    if params[:field_id] == "-1"
      recruits = Recruit.where("detail LIKE :hoge", hoge: "\%#{@query}\%")
    else
      recruits = Recruit.where("field_id = " + @field.to_s + " AND detail LIKE :hoge", hoge: "\%#{@query}\%")
    end
    @recruits = recruits.where.not(status: 2)
    users = ClientRecruitRelation.getUserByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(users)
    @rank_sum = Rank.getRankSum(users)
  end

  private
  def create_params
    params.permit(:field_id, :detail)
  end
end
