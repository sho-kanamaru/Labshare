class MessagesController < ApplicationController
  def index
    @recruit_id = params[:recruit_id]
  end

  def create
    Message.create(create_params)
    redirect_to recruit_message_path(params[:recruit_id], current_user)
  end

  def show
    @message = Message.new
    @messages = Message.order("created_at ASC")
    @recruit = Recruit.find(params[:recruit_id])
    @user = current_user
    @users = WorkerRecruitRelation.where(recruit_id: @recruit).map{ |user| User.find(user.user_id) }
    if WorkerRecruitRelation.where(user_id: @user, recruit_id: @recruit).size == 0
      WorkerRecruitRelation.create(user_id: @user, recruit_id: @recruit)
    end
  end

  private

  def create_params
    recruit_maker = ClientRecruitRelation.where(recruit_id: params[:recruit_id])
    recruit_maker_user = User.find(recruit_maker[0].id)
    params.require(:message).permit(:body).merge(from_id: current_user.id, to_id: recruit_maker_user.id, recruit_id: params[:recruit_id])
  end
end
