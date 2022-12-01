require 'rails_helper'

describe TasksController do 
  describe 'index #index' do
    describe 'user is signed in' do
      let!(:user) {User.create!({id: 40, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}

      describe 'there are no tasks' do
        it "renders the index template" do
          sign_in user
          get :index, :format => "html"
        end
      end

      describe 'there are tasks' do 
        let!(:param) {{id: 500, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 40, completed: false }}
        let!(:task) {Task.create!(param)}
        it '@tasks is assigned' do 
          sign_in user
          get :index, :format => "html"
          expect(assigns(:tasks)).to match_array([task])
        end 
      end 
    end

    describe 'user is not signed in' do
      it "displays root" do
        get :index, :format => "html"
        expect(response).to redirect_to(root_path)
      end
    end 
  end

  describe 'Show #show' do
    let!(:param) {{id: 500, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 40, completed: false}}
    let!(:task) {Task.create!(param)}

    describe 'user is signed in' do
      let!(:user) {User.create!({id: 40, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}

      it 'finds the task' do
        sign_in user
        get :show, id: task.id
        expect(assigns(:task)).to eql(task)
      end 

      it 'task does not exist' do
        sign_in user
        get :show, id: 3
        expect(response).to redirect_to(root_path)
      end
    end 

    describe 'user is not signed in' do
      it "displays root" do
        get :show, id: task.id
        expect(response).to redirect_to(root_path)
      end
    end 
  end

  describe "POST #create" do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task1) {Task.create!(param)}

    describe 'user is signed in' do
      let!(:user) {User.create!({id: 40, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
      context "with valid attributes" do
        it "creates a new task" do
          sign_in user
          expect{
            post :create, task: task1.attributes
          }.to change(Task,:count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not create a new task" do
          sign_in user
          post :create, task: { name: "Senior", price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}
          expect(flash[:warning]).not_to be_empty
          expect(response).to redirect_to(new_task_path)
        end
      end
    end 

    describe 'user is not signed in' do
      context "with valid attributes" do
        it "displays root" do
          post :create, task: task1.attributes
          expect(response).to redirect_to(root_path)
        end
      end
    end 
  end
  
  describe 'Edit' do
    let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 50, completed: false}}
    let!(:task) {Task.create!(param)}

    describe 'user is signed in' do
      it 'edits the task' do
        sign_in user
        get :edit, id: task.id, user_id: user.id
        expect(assigns(:task)).to eql(task)
      end

      it 'task does not exist' do
        sign_in user
        get :edit, id: 3, user_id: 50
        expect(response).to redirect_to(root_path)
      end
    end 

    describe 'user is not signed in' do
      it "displays root" do
        get :edit, id: task.id, user_id: user.id
        expect(response).to redirect_to(root_path)
      end
    end 
  end

  describe 'DELETE #destroy' do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}

    describe 'user is signed in' do
      let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}

      it 'deletes a task' do
        sign_in user
        delete :destroy, id: task.id
      end
    end 

    describe 'user is not signed in' do
      it "displays root" do
        delete :destroy, id: task.id
        expect(response).to redirect_to(root_path)
      end
    end 
  end


  describe 'DELETE all tasks #delete_all' do
  let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
  let!(:task) {Task.create!(param)}

  describe 'user is signed in' do
    let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}

    it 'deletes all tasks' do
      sign_in user
      delete :delete_all, id: task.id
    end
  end 

  describe 'user is not signed in' do
    it "displays root" do
      delete :delete_all, id: task.id
      expect(response).to redirect_to(root_path)
    end
  end 
end

  describe 'NEW #new' do
    it "gets the user id" do
      user3 = User.create(email: 'dt30@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800")
      sign_in user3
      get :new, user_id: user3.id
    end

    it "displays root if not signed in " do
      get :new, user_id: 10
      expect(response).to redirect_to(root_path)
    end
  end

  describe "PATCH #update" do
    let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:param) {{id: 1, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task1) {Task.create!(param)}

    describe "user is signed in" do 
      context "with good data" do
        it "updates the task" do
          sign_in user
          patch :update, id: 1, task: { name: "Senior", hours: 3, location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}
          expect(assigns(:task)).to eq(task1)
          # expect(flash[:notice]).to match('A task was successfully updated.')
          expect(response).to redirect_to(my_profile_tasks_path)
        end
      end

      context "with bad data" do
        it "does not update the task" do
          sign_in user
          patch :update, id: 1, task: { name: "Senior", hours: 3, price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}
          expect(flash[:notice]).to match("Location can't be blank")
          expect(response).to redirect_to(edit_task_path(1))
        end
      end
    end

    describe "user is signed out" do 
      it "user is signed out" do
        patch :update, id: 1, task: { name: "Senior", hours: 3}
        expect(response).to redirect_to(root_path)
      end
    end
  end


  describe "#my_profile" do
    let!(:user) {User.create!({id: 60, email: 'kj25@columbia.edu', password: 'password123456', fname: 'Kelsey', lname: 'John', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 60, completed: false}}
    let!(:task1) {Task.create!(param)}

    describe 'user is signed in' do
      it "set the first name, last name, school, and email" do
        sign_in user
        get :my_profile, first_name: user.fname, last_name: user.lname, school: user.school, email: user.email
      end
    end 

    describe 'user is not signed in' do
      it "displays root" do
        get :my_profile, first_name: user.fname, last_name: user.lname, school: user.school, email: user.email
        expect(response).to redirect_to(root_path)
      end
    end 
  end

  describe 'sort tasks from most recent date' do 
    let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:param) {{id: 1, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 50, completed: false, created_at: DateTime.new(2022,11,5)}}
    let!(:task1) {Task.create!(param)}
    let!(:param2) {{id: 2, name: 'Chores', hours: 2, deadline: DateTime.new(2022,12,6), location: 'East Campus', price: 20, description: 'Need help cleaning my dorm', user_id: 50, completed: false, created_at: DateTime.new(2022,11,6)}}
    let!(:task2) {Task.create!(param2)}
    
    it "sorts tasks from recent date" do
      sign_in user
      get :index, :sort => 'created_at_new'
      expect(assigns(:tasks)).to match_array([task2, task1])
    end
  end


  describe 'sort tasks from oldest date' do 
    let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:param) {{id: 1, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 50, completed: false, created_at: DateTime.new(2022,11,5)}}
    let!(:task1) {Task.create!(param)}
    let!(:param2) {{id: 2, name: 'Chores', hours: 2, deadline: DateTime.new(2022,12,6), location: 'East Campus', price: 20, description: 'Need help cleaning my dorm', user_id: 50, completed: false, created_at: DateTime.new(2022,11,6)}}
    let!(:task2) {Task.create!(param2)}
    
    it "sorts tasks from oldest date" do
      sign_in user
      get :index, :sort => 'created_at_old'
      expect(assigns(:tasks)).to match_array([task1, task2])
    end
  end


  describe 'sort tasks from low to high' do 
    let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:param) {{id: 1, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 50, completed: false, created_at: DateTime.new(2022,11,5)}}
    let!(:task1) {Task.create!(param)}
    let!(:param2) {{id: 2, name: 'Chores', hours: 2, deadline: DateTime.new(2022,12,6), location: 'East Campus', price: 20, description: 'Need help cleaning my dorm', user_id: 50, completed: false, created_at: DateTime.new(2022,11,6)}}
    let!(:task2) {Task.create!(param2)}
    
    it "sorts tasks low to high" do
      sign_in user
      get :index, :sort => 'lowest_to_highest_pay'
      expect(assigns(:tasks)).to match_array([task2, task1])
    end
  end

  describe 'sort tasks from high to low' do 
    let!(:user) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:param) {{id: 1, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 50, completed: false, created_at: DateTime.new(2022,11,5)}}
    let!(:task1) {Task.create!(param)}
    let!(:param2) {{id: 2, name: 'Chores', hours: 2, deadline: DateTime.new(2022,12,6), location: 'East Campus', price: 20, description: 'Need help cleaning my dorm', user_id: 50, completed: false, created_at: DateTime.new(2022,11,6)}}
    let!(:task2) {Task.create!(param2)}
    
    it "sorts tasks high to low" do
      sign_in user
      get :index, :sort => 'highest_to_lowest_pay'
      expect(assigns(:tasks)).to match_array([task1, task2])
    end
  end

 
  describe 'accept task #accept' do
    let!(:param) {{id: 1, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}

    describe 'user is signed in' do
      let!(:user_accepting) {User.create!({id: 50, email: 'ad45@columbia.edu', password: 'password12345', fname: 'Alison', lname: 'Doll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}

      it 'user accepts task to do' do
        sign_in user_accepting
        patch :accept, id: 1, task: {id: 1, name: "Senior", hours: 3, location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false, user_accepted_id: user_accepting.id}
        expect(assigns(:task.user_accepted_id)).to eq(user_accepting.id)
        expect(response).to redirect_to(my_profile_tasks_path)
      end
    end 

    describe 'user is not signed in' do
      it "displays root" do
        patch :accept, id: 1, task: { name: "Senior", hours: 3, location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false, user_accepted_id: user_accepting.id}
        expect(response).to redirect_to(root_path)
      end
    end 
  end

end


#Resources:
#https://github.com/heartcombo/devise/wiki/How-To:-Test-controllers-with-Rails-(and-RSpec)
#https://relishapp.com/rspec/rspec-rails/v/4-0/docs/controller-specs
#https://github.com/heartcombo/devise/wiki/How-To:-sign-in-and-out-a-user-in-Request-type-specs-(specs-tagged-with-type:-:request)#1-simple-approach



