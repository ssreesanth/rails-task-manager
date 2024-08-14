class TasksController < ApplicationController

def list
  @tasks = Task.all
end

def show
  @task = Task.find(params[:id])
end

def new
  @task = Task.new
end

def create
  @task = Task.new(task_params)
  @task.save
  # No need for app/views/restaurants/create.html.erb
  redirect_to task_path(@task)
end

def find
  @task = Task.find(params[:id])
end

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  @task.update(task_params)
  # No need for app/views/restaurants/update.html.erb
  redirect_to task_path(@task)
end

def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_list_path, status: :see_other
end

private

# This is a strong param to keep the data safe
def task_params
  params.require(:task).permit(:title, :details)
end



end
