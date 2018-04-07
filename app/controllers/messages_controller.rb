class MessagesController < ApplicationController
  def index
    @recruit_id = params[:recruit_id]
  end

  def show
    @recruit_id = params[:recruit_id]
    @user_id = params[:user_id]
    WorkerRecruitRelation.save(user_id: @user_id, recruit_id: @recruit_id)
  end
end
