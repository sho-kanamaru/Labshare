class MessagesController < ApplicationController
  def index
    @recruit_id = params[:recruit_id]
  end

  def create
    Message.create(create_params)
    redirect_to recruit_message_path(params[:recruit_id], params[:message][:to_user_id])
  end

  def show
    @message = Message.new
    @recruit = Recruit.find(params[:recruit_id])

    # 求人案件を作製した人
    @client = get_recruit_maker_user
    @messages = Message.where(recruit_id: @recruit.id).order("created_at ASC")

    # 応募者
    @users = get_applied_users

    @to_user_id = params[:user_id]

    if WorkerRecruitRelation.where(user_id: current_user.id, recruit_id: params[:recruit_id]).size == 0 && @client != current_user
      WorkerRecruitRelation.create(user_id: current_user.id, recruit_id: params[:recruit_id])
    end

    # 既読つける
    Message.getUnreadMessage(current_user).where(recruit_id: params[:recruit_id]).update_all(read_flg: true)
  end

  private

  def get_recruit_maker_user
    recruit_maker = ClientRecruitRelation.where(recruit_id: params[:recruit_id])
    recruit_maker_user = User.find(recruit_maker[0].user_id)
  end

  private
  def get_applied_users
    applied_users = WorkerRecruitRelation.where(recruit_id: params[:recruit_id])
    users = applied_users.map{ |user| User.find(user.user_id)}
  end

  def create_params
    to_id = params[:message][:to_user_id]
    params.require(:message).permit(:body).merge(from_id: current_user.id, to_id: to_id, recruit_id: params[:recruit_id])
  end
end
