class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  # after_action :redirect, only: [:create, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  private

  def find_task
    @task = Task.find(params[:id])
  end

  #def redirect
    #redirect_to tasks_path
  #end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
