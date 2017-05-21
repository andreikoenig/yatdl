class TasksController < ApplicationController
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Task updated"
      redirect_to root_path
    else
      flash.now[:danger] = "Task not updated"
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete!
    flash[:success] = "Task completed"
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "Task has been deleted"
      redirect_to root_path
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :quadrant)
    end
end
