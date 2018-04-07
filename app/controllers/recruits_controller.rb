class RecruitsController < ApplicationController

  def new
    @fields = Field.all
  end

  def create
    recruit = Recruit.create(title: create_params[:title], field_id: create_params[:field_id], detail: create_params[:detail])
    ClientRecruitRelation.create(user_id: current_user.id, recruit_id: recruit.id)
    redirect_to clients_path
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  private
  def create_params
    params.permit(:title, :field_id, :detail)
  end

end
