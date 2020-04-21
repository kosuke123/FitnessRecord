class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end

  def show
    @trainings = Training.where(user_id: params[:id])
    @user = User.find_by(id: params[:id])
    # @user = current_user
      
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def create
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
  end

end
