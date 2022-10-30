class TasksController < ApplicationController
  # before_action :force_index_redirect, only: [:index]

  def show
    # id = params[:id] # retrieve task ID from URI route
    # @task = Task.find(id) # look up movie by unique ID
    # # will render app/views/movies/show.<extension> by default
    if !user_signed_in?
      redirect_to root_path
    end

    redirect_to my_profile_tasks_path
  end

  def index
    #@tasks = Movie.with_ratings(ratings_list, sort_by)
    # @ratings_to_show_hash = ratings_hash
    # @sort_by = sort_by
    # remember the correct settings for next time
    # session['ratings'] = ratings_list
    # session['sort_by'] = @sort_by
    if !user_signed_in?
      redirect_to root_path
    end

    if Task.joins(:user).exists?(:users => {school: current_user.school})
      @tasks = Task.joins(:user).where(:users => {school: current_user.school})
    else
      @tasks = []
    end
  end

  def new
    # default: render 'new' template
    if !user_signed_in?
      redirect_to root_path
    end

    @user_id = current_user.id
  end

  def create
    @task = Task.create!(task_params)
    flash[:notice] = "A task was successfully created."
    redirect_to my_profile_tasks_path
  end

  def edit
    if !user_signed_in?
      redirect_to root_path
    end

    @task = Task.find params[:id]
    @user_id = current_user.id
    @id = @task.id
    @name = @task.name
    @description = @task.description
    @hours = @task.hours
    @location = @task.location
    @price = @task.price
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes!(task_params)
    flash[:notice] = "A task was successfully updated."
    redirect_to my_profile_tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "A task was deleted."
    redirect_to my_profile_tasks_path
  end

  def my_profile
    if !user_signed_in?
      redirect_to root_path
    end

    @my_tasks = Task.where(user_id: current_user.id) == nil ? [] : Task.where(user_id: current_user.id)
    @first_name = current_user.fname
    @last_name = current_user.lname
    @school = current_user.school
    @email = current_user.email
  end

  private
  def task_params
      params.require(:task).permit(:name, :hours, :location, :price, :description, :user_id)
  end
end
