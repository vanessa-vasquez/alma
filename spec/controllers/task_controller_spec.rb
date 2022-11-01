require 'rails_helper'

describe TasksController do 
  describe 'index' do
    it "renders the index template" do
      user = User.create(email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University')
      sign_in user
      get :index, :format => "html"
      #expect(response).to render_template("index")
    end
  end

  describe 'Show #show' do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}

    it 'finds the task' do
      get :show, id: task.id
      expect(assigns(:task)).to eql(task)
    end 
  end

  describe "POST #create" do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task1) {Task.create!(param)}

    context "with valid attributes" do
      it "creates a new task" do
        expect{
          post :create, task: task1.attributes
        }.to change(Task,:count).by(1)
      end
    end
  end
  
  describe 'Edit' do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}

    it 'edits the task' do
      user = User.create(email: 'dt30@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University')
      sign_in user
      get :edit, id: task.id, user_id: user.id
      expect(assigns(:task)).to eql(task)
    end
  end

  describe 'DELETE #destroy' do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}
    it 'deletes a task' do
      delete :destroy, id: task.id
    end
  end

  describe 'NEW #new' do
    it "redirects if user is not signed in" do
      
    end

    it "gets the user id" do
      user3 = User.create(email: 'dt30@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University')
      sign_in user3
      get :new, user_id: user3.id
    end
 
  end

  describe "PATCH #update" do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task1) {Task.create!(param)}

    context "with good data" do
      it "updates the task" do
        patch :update, id: task1.id, task: { name: "Senior Photos", hours: 3}
        expect(response).to be_redirect
      end
    end
  end


  describe "#my_profile" do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task1) {Task.create!(param)}

    it "set the first name, last name, school, and email" do
      user = User.create(email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University')
      sign_in user
      get :my_profile, first_name: user.fname, last_name: user.lname, school: user.school, email: user.email
    end
  end
    

end


#Resources:
#https://github.com/heartcombo/devise/wiki/How-To:-Test-controllers-with-Rails-(and-RSpec)
#https://relishapp.com/rspec/rspec-rails/v/4-0/docs/controller-specs
#https://github.com/heartcombo/devise/wiki/How-To:-sign-in-and-out-a-user-in-Request-type-specs-(specs-tagged-with-type:-:request)#1-simple-approach



