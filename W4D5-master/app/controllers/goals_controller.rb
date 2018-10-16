class GoalsController < ApplicationController
  def index
    @goals = Goal.all
    render :index
  end
  
  def show
    @goal = Goal.find(params[:id])
    render :show
  end
  
  def new
    @goal = Goal.new
    render :new
  end
  
  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to user_goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
    end
  end
  
  def edit
    @goal = Goal.find(params[:id])
    rener :edit
  end
  
  def update
    
  end
  
  def delete
    
  end
  
  private
  
  def goal_params
    params.require(:goal).permit(:title, :description)
  end
end

