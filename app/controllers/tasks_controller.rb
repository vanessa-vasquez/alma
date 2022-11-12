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
    @created_at = @task.created_at
  end
 
  def index
    if (!user_signed_in?)
      return redirect_to root_path
    end

    if Task.joins(:user).exists?(:users => {school: current_user.school})
      @tasks = Task.find_tasks(current_user.school, params[:pay])
    else
      @tasks = []
    end

    if (params[:sort] != nil)
      @sort = params[:sort]
    end
  
    if (@sort == "created_at_old")
      @sort_oldest_date_header = ''
      @tasks = @tasks.order(created_at: :asc)
    elsif (@sort == "created_at_new")
      @sort_recent_date_header = ''
      @tasks = @tasks.order(created_at: :desc)
    elsif (@sort == "lowest_to_highest_pay")
      @sort_low_high_price_header = ''
      @tasks = @tasks.order(price: :asc)
    elsif (@sort == "highest_to_lowest_pay")
      @sort_high_low_price_header = ''
      @tasks = @tasks.order(price: :desc)

    end

    session[:sort] = @sort
  end

  def new
    if !user_signed_in?
      return redirect_to root_path
    end
    @user_id = current_user.id
  end

  def create
    if !user_signed_in?
      return redirect_to root_path
    end

    task = Task.new(task_params)
    valid = task.valid?

    if !valid
      flash[:warning] = task.errors.full_messages[0]
      return redirect_to new_task_path
    else
      @task = Task.create(task_params)
      @created_at = Time.now
      flash[:notice] = "A task was successfully created."
      return redirect_to my_profile_tasks_path
    end
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
    @created_at = Time.now
    
  end

  def update
    if !user_signed_in?
      return redirect_to root_path 
    end
    @task = Task.find params[:id]
    @task.update_attributes!(task_params)
    flash[:notice] = "A task was successfully updated."
    redirect_to my_profile_tasks_path
  end

  def destroy
    if !user_signed_in?
      return redirect_to root_path 
    end
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
      params.require(:task).permit(:name, :hours, :location, :price, :description, :user_id, :sort)
  end
end
