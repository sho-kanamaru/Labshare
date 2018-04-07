class MessagesController < ApplicationController
  def index
    @recruit_id = params[:recruit_id]
  end

  def show
    @recruit_id = params[:recruit_id]
    @user_id = params[:user_id]
  end
end
