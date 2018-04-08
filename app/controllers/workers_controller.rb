class WorkersController < ApplicationController
  include WorkersHelper

  def index
    @recruits = get_recruits
    users = @recruits.map{|recruit| recruit.users.first}
    @fields = Field.all
    @url = "/workers/search"
    @rank = Rank.clientRankAverage(users)

    @messages = Message.where(to_id: current_user)
  end

  def show
    @fields = Field.all
    @user = current_user
    @recruits = Recruit.getAppliedRecruitList(current_user.id)
    user_ids = ClientRecruitRelation.getUserByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(user_ids)
  end

  def search
    @fields = Field.all
    @field = params[:field_id]
    @query = params[:query]
    @url = "/workers/search"
    if params[:field_id] == "-1"
      @recruits = Recruit.where("detail LIKE :hoge", hoge: "\%#{@query}\%")
    else
      @recruits = Recruit.where("field_id = " + @field.to_s + " AND detail LIKE :hoge", hoge: "\%#{@query}\%")
    end
    users = ClientRecruitRelation.getUserByRecruitId(@recruits)
    @rank = Rank.clientRankAverage(users)
  end

  private
  def create_params
    params.permit(:field_id, :detail)
  end
end
