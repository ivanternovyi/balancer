class TasksController < ApplicationController
  before_action :find_task, only: :compute

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
    @task.compute_factorization
    redirect_to root_path
  end

  private

  def find_task
    @task ||= Task.find_by(id: params[:id])
  end

  def task_params
    params.permit(:digit)
  end
end
