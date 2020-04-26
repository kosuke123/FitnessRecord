class KindsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @kind = Kind.all
    @trainings = Training.all
  end

  def show
    @trainings = Training.where(kind_id: params[:id])
  end
end
