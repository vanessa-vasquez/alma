class TasksController < ApplicationController
  before_action :force_index_redirect, only: [:index]

  def show_task
    id = params[:id] # retrieve task ID from URI route
    @task = Task.find(id) # look up task by unique ID
    # will render app/views/tasks/show.<extension> by default
  end

  def index
    @all_tasks = tasks.all_times
    @tasks = Task.with_times(times_list)
    @times_to_show_hash = times_hash
    # remember the correct settings for next time
    session['times'] = times_list
  end

  def new
    # default: render 'new' template
  end

  def create_task
    @task = Task.create!(task_params)
    flash[:notice] = "#{@task.title} was successfully created."
    redirect_to tasks_path
  end

  def edit_task
    @task = Task.find params[:id]
  end

  def update_task
    @task = Task.find params[:id]
    @task.update_attributes!(task_params)
    flash[:notice] = "#{@task.title} was successfully updated."
    redirect_to task_path(@task)
  end

  def destroy_task
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task'#{@task.title}' deleted."
    redirect_to tasks_path
  end

  private

  def force_index_redirect
    if !params.key?(:times)
      flash.keep
      url = tasks_path(times:times_hash)
      redirect_to url
    end
  end

  def time_list
    params[:times]&.keys || session[:times] || Task.all_times
  end

  def times_hash
    Hash[times_list.collect { |item| [item, "1"] }]
  end

  def sort_by
    params[:sort_by] || session[:sort_by] || 'id'
  end
end
