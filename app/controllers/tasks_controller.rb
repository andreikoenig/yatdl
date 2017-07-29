class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :complete, :destroy]

  def index
    @task = Task.new
    uncompleted_tasks = Task.where(time_completed: nil)
    # @tasks_by_quadrant = uncompleted_tasks.group_by(&:quadrant)
    @quad1_tasks = find_tasks_by_quadrant(uncompleted_tasks, 1)
    @quad2_tasks = find_tasks_by_quadrant(uncompleted_tasks, 2)
    @quad3_tasks = find_tasks_by_quadrant(uncompleted_tasks, 3)
    @quad4_tasks = find_tasks_by_quadrant(uncompleted_tasks, 4)
  end

  def mind_dump
    all_tasks = Task.where(time_completed: nil)
    @assigned_tasks = all_tasks.reject {|task| task.quadrant.nil? }
    @unassigned_tasks = find_tasks_by_quadrant(all_tasks, nil)
    @task = Task.new
  end

  def unassigned
    @unassigned_tasks = Task.where(quadrant: nil)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_back(fallback_location: root_path)
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

    def find_tasks_by_quadrant(tasks, quadrant)
      tasks.select { |task| task.quadrant == quadrant}
    end
end
