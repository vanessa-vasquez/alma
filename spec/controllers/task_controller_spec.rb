require 'rails_helper'


describe TasksController do 
  describe 'index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'Show' do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}

    let!(:param2) {{email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University'}}
    let!(:user) {User.create!(param2)}

    it 'finds the task' do
      get :show, id: task.id
      expect(assigns(:task)).to eql(task)
    end 
  end


  describe "POST create" do
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
    let!(:param2) {{email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University'}}
    let!(:current_user) {User.create!(param2)}

    it 'edits the task' do
      get :edit, id: task.id, user_id: current_user.id
      expect(assigns(:task)).to eql(task)
    end
  end

  describe 'Delete' do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}
    it 'deletes a task' do
      delete :destroy, id: task.id
    end
  end

  describe 'New' do
    let!(:param2) {{email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University'}}
    let!(:user) {User.create!(param2)}

    # it 'checks if user is not signed in' do
    #   expect(response).to render_template("index")
    # end
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
    

end


#Resources:
#https://github.com/heartcombo/devise/wiki/How-To:-Test-controllers-with-Rails-(and-RSpec)
#https://relishapp.com/rspec/rspec-rails/v/4-0/docs/controller-specs




