class RecruitsController < ApplicationController

  def new
  end

  def create
    Recruit.create(title: create_params[:title], field_id: create_params[:field_id], detail: create_params[:detail])
    redirect_to clients_path
  end

  def show
  end

  private
  def create_params
    params.permit(:title, :field_id, :detail)
  end

end
