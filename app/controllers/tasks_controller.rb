class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  	@task = Task.new
  end 

  def create
  	@task = Task.new(task_params)
  	if @task.save
  	  redirect_to tasks_path
  	else 
  	  render new
  	end 
  end

  def show
    @task = Task.find(params[:id])
    @status = " "

    if @task.completed == true
      @status = "This task has been completed."
    else
      @status = "This task has not been completed."
    end 
  end 

   private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
