class TasksController < ApplicationController
  # before_action :force_index_redirect, only: [:index]

  def show
    # id = params[:id] # retrieve task ID from URI route
    # @task = Task.find(id) # look up movie by unique ID
    # # will render app/views/movies/show.<extension> by default
  end

  def index
    #@all_tasks = tasks.all_ratings
    #@tasks = Movie.with_ratings(ratings_list, sort_by)
    # @ratings_to_show_hash = ratings_hash
    # @sort_by = sort_by
    # remember the correct settings for next time
    # session['ratings'] = ratings_list
    # session['sort_by'] = @sort_by
  end

  def new
    # default: render 'new' template
  end

  def create
  #   @task = Task.create!(task_params)
  #   flash[:notice] = "#{@task.title} was successfully created."
  #   redirect_to tasks_path
  end

  def edit
    # @task = Task.find params[:id]
  end

  def update
    # @task = Task.find params[:id]
    # @task.update_attributes!(task_params)
    # flash[:notice] = "#{@task.title} was successfully updated."
    # redirect_to movie_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    # @task.destroy
    # flash[:notice] = "Task '#{@task.title}' deleted."
    # redirect_to tasks_path
  end

  def my_tasks
    # @task = Task.find(params[:id])
    # @task.destroy
    # flash[:notice] = "Task '#{@task.title}' deleted."
    # redirect_to tasks_path
  end
end
