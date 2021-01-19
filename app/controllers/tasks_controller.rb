class TasksController < ApplicationController
  
  def index
     @user = User.find_by(params[:user_id])
     @tasks = @user.tasks
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
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
       flash[:notice] = "タスクを更新しました"
       redirect_to tasks_index_url
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_index_url 
  end
  
  private
    def task_params
        params.require(:task).permit(:name, :description)
    end
end
