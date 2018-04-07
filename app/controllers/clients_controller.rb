class ClientsController < ApplicationController
  def index
    user_id = current_user.id
    @recruits = Recruit.getMyRecruitList(user_id)
    @ranks = Rank.getRecruitRankAverage(user_id, @recruits)
  end

  def show
    @client_recruit = Recruit.find(params[:id])
    @applicants = WorkerRecruitRelation.where(recruit_id: @client_recruit.id)
    @user_id = ClientRecruitRelation.find_by(recruit_id: params[:id])
  end

  def edit
    @url = "/clients/"+params[:id]
    @fields = Field.all
    @recruit = Recruit.find(params[:id])
  end


 

  private
  def create_params
    params.permit(:title, :field_id, :detail)
  end
end
