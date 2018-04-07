class WorkersController < ApplicationController
  def index
    @recruits = Recruit.all
  end
end
