class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def new
    @user = User.find_by(params[:user_id])
    @task = Task.new
  end
  
  def create
    @task = Task.new(
      name: params[:name],
      description: params[:description]
      )
    @task.save
        flash[:notice] = "タスクを新規登録しました"
    redirect_to user_tasks_path
  end
  

  def show
    @task = Task.find(params[:id])
  end
end
