class TasksController < ApplicationController
  def show
    if !user_signed_in?
      return redirect_to root_path
    elsif Task.where(id: params[:id]).empty? || (!Task.where(id: params[:id]).empty? && (Task.find(params[:id]).user_id != current_user.id))
      return redirect_to root_path
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
      return redirect_to root_path
    end

    if (Task.joins(:user).exists?)
      @tasks = Task.joins(:user).where(school: current_user.school)
    else
      @tasks = []
    end

  end

  def new
    if !user_signed_in?
      return redirect_to root_path
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
      return redirect_to root_path
    elsif Task.where(id: params[:id]).empty? || (!Task.where(id: params[:id]).empty? && (Task.find(params[:id]).user_id != current_user.id))
      return redirect_to root_path
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
      return redirect_to root_path
    end
    if (user_signed_in?)
      @my_tasks = Task.where(user_id: current_user.id) == nil ? [] : Task.where(user_id: current_user.id)
      @first_name = current_user.fname
      @last_name = current_user.lname
      @school = current_user.school
      @email = current_user.email
    end
    
  end

  private
  def task_params
      params.require(:task).permit(:name, :hours, :location, :price, :description, :user_id)
  end
end
