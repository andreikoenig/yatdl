class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :complete, :destroy]
  def index
    @task = Task.new
    @uncompleted_tasks = Task.where(time_completed: nil)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_url
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "Task updated"
      redirect_to root_path
    else
      flash.now[:danger] = "Task not updated"
      render :edit
    end
  end

  def complete
    @task.complete!
    flash[:success] = "Task completed"
    redirect_to root_path
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task has been deleted"
      redirect_to root_path
    end
  end

  private
    def find_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :quadrant)
    end
end
