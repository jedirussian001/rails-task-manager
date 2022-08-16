class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id]) #this is "task" singular because it showns one task
  end

  def new
    @task = Task.new # Needed to instantiate the form_for
  end

  def create
    @task = Task.new(params_task)
    @task.save
    redirect_to tasks_path(@task) #remove task if you want to go to "show" page
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params_task)
    redirect_to tasks_path(@task) #meebi task?
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other # see other is used because otherwise it would try to access route by verb delete /instead should use get.
  end

private

  def params_task
    params.require(:task).permit(:title, :details, :completed)
  end
end
