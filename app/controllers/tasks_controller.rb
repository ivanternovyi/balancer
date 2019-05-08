class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end

  def compute
    ComputeFactorizationJob.set(wait: 10.seconds).perform_later(params[:id])
    redirect_to root_path
  end

  private

  def task_params
    params.permit(:digit)
  end
end
