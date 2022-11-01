class TasksController < ApplicationController
  def show
    if !user_signed_in?
      redirect_to root_path and return
    end

    @task = Task.find params[:id]
    @id = @task.id
    @name = @task.name
    @description = @task.description
    @hours = @task.hours
    @location = @task.location
    @price = @task.price
  end

  def index

    if (!user_signed_in?)
      redirect_to root_path and return
    end

    if Task.joins(:user).exists?(:users => {school: current_user.school})
      if !@user.school.blank?
        @tasks = Task.joins(:user).where(:users => {school: current_user.school})
      end
    else
      @tasks = []
    end
  end

  def new
    if !user_signed_in?
      redirect_to root_path and return
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
      redirect_to root_path and return
    end

    @task = Task.find params[:id]
    if (current_user != nil)
      @user_id = current_user.id
    end

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
      redirect_to root_path and return
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
