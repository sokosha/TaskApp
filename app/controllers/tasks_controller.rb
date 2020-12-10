class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def new
    @user = User.find_by(params[:user_id])
    @task = Task.new
  end
  
  def create
    @user = User.find_by(params[:user_id])
    @task = @user.tasks.new(task_params)
    # @task = @user.tasks.new(neme: params[:task][:name], description: params[:task][:description])
    # @task = Task.new(neme: params[:task][:name], description: params[:task][:description], user_id: @user.id)
    @task.save
        flash[:notice] = "タスクを新規登録しました"
    redirect_to user_tasks_path
  end
  

  def show
    @task = Task.find(params[:id])
  end
  
  private
    def task_params
        params.require(:task).permit(:name, :description)
    end
end
