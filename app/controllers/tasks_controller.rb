class TasksController < ApplicationController

  def show
    if !user_signed_in?
      return redirect_to root_path
    end

    @task = Task.find params[:id]
    @user_id = @task.user_id
    @id = @task.id
    @name = @task.name
    @description = @task.description
    @hours = @task.hours
    @location = @task.location
    @price = @task.price
    @created_at = @task.created_at
    @user_accepted_id = @task.user_accepted_id
    
    if @user_accepted_id != nil && @user_accepted_id != 0
      @user = User.find @user_accepted_id.to_i
      @user_accepted_uni = @user.email
    end
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
  
    if (@sort == "created_at_old" && @tasks != [])
      @sort_oldest_date_header = ''
      @tasks = @tasks.order(created_at: :asc)
    elsif (@sort == "created_at_new" && @tasks != [])
      @sort_recent_date_header = ''
      @tasks = @tasks.order(created_at: :desc)
    elsif (@sort == "lowest_to_highest_pay" && @tasks != [])
      @sort_low_high_price_header = ''
      @tasks = @tasks.order(price: :asc)
    elsif (@sort == "highest_to_lowest_pay" && @tasks != [])
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
    @user_accepted_id = @task.user_accepted_id
    @created_at = Time.now
  end

  def update
    if !user_signed_in?
      return redirect_to root_path 
    end

    @task = Task.find(params[:id])
    task = Task.new(task_params)

    if task.valid?
      @task.update_attributes(task_params)
      flash[:notice] = task_params
      # flash[:notice] = "A task was successfully updated."
      redirect_to my_profile_tasks_path
    else
      flash[:notice] = task.errors.full_messages[0]
      redirect_to edit_task_path(params[:id])
    end
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

      @accepted_tasks = Task.where(user_accepted_id: current_user.id) == nil ? [] : Task.where(user_accepted_id: current_user.id)
    end
  end

  def delete_all
    if !user_signed_in?
      return redirect_to root_path
    end

    Task.where(user_id: current_user.id).delete_all
    flash[:notice] = "You have removed all your tasks!"
    redirect_to my_profile_tasks_path
  end

  def accept
    if !user_signed_in?
      return redirect_to root_path
    end

    @task = Task.find((params["format"]).to_i)
    @task.user_accepted_id = current_user.id
    @task.update_attributes(task_params_accept)

    redirect_to my_profile_tasks_path
  end

  def delete_accepted
    if !user_signed_in?
      return redirect_to root_path
    end

    @task = Task.find((params["format"]).to_i)
    @task.user_accepted_id = 0
    @task.update_attributes(task_params_accept)

    redirect_to my_profile_tasks_path
  end

  def completed
    if !user_signed_in?
      return redirect_to root_path
    end

    @task = Task.find((params["format"]).to_i)
    @task.completed = true
    @task.update_attributes(task_params_accept)

    redirect_to my_profile_tasks_path
  end

  private
  def task_params
      # This allows you to create and edit a new task but not accept and mark as complete
      params.require(:task).permit(:name, :hours, :location, :price, :description, :user_id, :completed, :user_accepted_id, :sort)
      
      # This allows you to accept and mark as complete but not create and edit a new task
      # params.permit(:name, :hours, :location, :price, :description, :user_id, :completed, :user_accepted_id, :sort)
  end

  private
  def task_params_accept
      # This allows you to accept and mark as complete but not create and edit a new task
      params.permit(:name, :hours, :location, :price, :description, :user_id, :completed, :user_accepted_id, :sort)
  end
end
