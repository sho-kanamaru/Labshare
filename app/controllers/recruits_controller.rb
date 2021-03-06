class RecruitsController < ApplicationController

  def new
    @fields = Field.all
  end

  def create
    current_user.recruits.create(create_params)
    redirect_to clients_path
  end

  def show
    @url = "/recruits/"+params[:id]+"approvals"
    # 案件の情報取得
    @recruit = Recruit.find(params[:id])
    # @applicants = WorkerRecruitRelation.where(recruit_id: @client_recruit.id)

    # 掲載しているクライアント情報を取得
    @client = @recruit.users.first

    # 案件に申し込んでいる人の情報を取得
    # @applied_users = WorkerRecruitRelation.where(recruit_id: params[:id]).map{ |user| User.find(user.user_id)}
    @applied_users = WorkerRecruitRelation.where(recruit_id: params[:id])

    @user = current_user
    applied_users = @applied_users.map{ |user| User.find(user.user_id)}
    if applied_users.include?(@user)
      @applied = true
    else
      applied_user = @applied_users.find{|user| user.status}
      @url_complete = "/recruits/#{@recruit.id}/completes/#{applied_user.user.id}"
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
    recruit.update(create_params)
    redirect_to :action => "show"
  end

  def approval
    worker_recruit_relation = WorkerRecruitRelation.where(user_id: params[:user_id], recruit_id: params[:recruit_id])
    worker_recruit_relation.update(status: 1)
    recruit = Recruit.find(params[:recruit_id])
    recruit.update(status: 1)
    redirect_to recruit_path(params[:recruit_id])
  end

  def complete
    worker_recruit_relation = WorkerRecruitRelation.where(user_id: params[:user_id], recruit_id: params[:recruit_id])
    worker_recruit_relation.update(status: 2)
    recruit = Recruit.find(params[:recruit_id])
    recruit.update(status: 2)
    recruit.field.ranks.create(rank: params[:rank][:rank], from_id: current_user.id, to_id: params[:user_id])
    redirect_to recruit_path(params[:recruit_id])
  end

  private
  def create_params
    params.permit(:title, :field_id, :detail, :recruit_money)
  end

end
