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
    @url = "/recruits/"+params[:id]+"approvals"
    # 案件の情報取得
    @recruit = Recruit.find(params[:id])
    # @applicants = WorkerRecruitRelation.where(recruit_id: @client_recruit.id)

    # 掲載しているクライアント情報を取得
    client_id = ClientRecruitRelation.find_by(recruit_id: params[:id]).user_id
    @client = User.find(client_id)

    # 案件に申し込んでいる人の情報を取得
    @applied_users = WorkerRecruitRelation.where(recruit_id: params[:id]).map{ |user| User.find(user.user_id)}

    @user = current_user

    if @applied_users.include?(@user)
      @applied = true
    else
      @applied = false
    end
  end
  
  def edit
    @url = "/recruits/"+params[:id]
    @fields = Field.all
    @recruit = Recruit.find(params[:id])
  end

  def update
    recruit = Recruit.find(params[:id])
    recruit.update(title: create_params[:title], field_id: create_params[:field_id], detail: create_params[:detail])
    redirect_to :action => "show"
  end

  def approval
    worker_recruit= Recruit.find(params[:user_id])
    binding.pry
  end


 

  private
  def create_params
    params.permit(:title, :field_id, :detail)
  end

end
