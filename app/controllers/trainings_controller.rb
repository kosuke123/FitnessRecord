class TrainingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @trainings = Training.all.order(created_at: :desc)
  
    @like = Like.new
  end

  def new

    @training = Training.new
    @kinds = Kind.all
    
  end

  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id

    if @training.save!
      redirect_to :action => "index"
      flash[:notice] = "Good Training!!"

    else
      render("trainings/new")
    end

  end

  def show
    @training = Training.find(params[:id])
    @like = Like.new
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @trainings = Training.find_by(id: params[:id])
    @trainings.body = params[:body]
    if @trainings.save
      redirect_to :action => "show", :id => @trainings.id
      flash[:notice] = "Training edited"
    else
      render("trainings/new")
      # redirect_to :action => "new"
    end
  end

  def destroy
    Training.find(params[:id]).destroy
    flash[:notice] = "Training deleted"
    redirect_to action: :index
  end

  private
  def training_params
    params.require(:training).permit(:body, :howmany, :howmanysets, :datetime, :image, :movie, :user_id, :kind_id)
  end
end
