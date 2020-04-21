class LikesController < ApplicationController
  before_action :authenticate_user!
  
    def create
        @like = current_user.likes.create(training_id: params[:training_id])
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        @like = Like.find_by(training_id: params[:training_id], user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
      end
end
