class UsersController < ApplicationController
  before_action :force_index_redirect, only: [:index]

  def show_user
    id = params[:id] # retrieve task ID from URI route
    @user= User.find(id) # look up task by unique ID
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

  def create_user
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.first_name} #{@user.last_name} was successfully created."
    redirect_to tasks_path
  end

  def edit_user
    @user = User.find params[:id]
  end

  def update_user
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.first_name} #{@user.last_name} was successfully updated."
    redirect_to users_path(@user)
  end

  def delete_account
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User'#{@user.first_name} #{@user.last_name}' deleted."
    redirect_to tasks_path
  end

  def force_index_redirect
    if !params.key?(:times)
      flash.keep
      url = tasks_path(times:times_hash)
      redirect_to url
    end
  end
 
end
