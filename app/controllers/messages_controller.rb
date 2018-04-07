class MessagesController < ApplicationController
  def index
    @recruit_id = params[:recruit_id]
  end

  def show
    @recruit_id = params[:recruit_id]
    @user_id = params[:user_id]
    @users = WorkerRecruitRelation.where(@recruit_id).map{ |user| User.find(user.user_id) }
    if WorkerRecruitRelation.where(user_id: @user_id, recruit_id: @recruit_id).size == 0
      WorkerRecruitRelation.create(user_id: @user_id, recruit_id: @recruit_id)
    end
  end
end
