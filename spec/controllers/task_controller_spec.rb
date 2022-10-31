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
    it 'finds the movie' do
      get :show, id: task.id
      expect(assigns(:task)).to eql(task)
    end
  end

  it "renders the new template" do
    get :new
    expect(response).to render_template("new")
  end

  describe 'Edit' do
    let!(:param) {{name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false}}
    let!(:task) {Task.create!(param)}
    it 'edits the task' do
      get :edit, id: task.id
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

end

#Resources:
#https://relishapp.com/rspec/rspec-rails/v/4-0/docs/controller-specs



# require 'rails_helper'

# RSpec.describe TasksController, type: :controller do
#    describe "GET show" do 
#     it "shows find correctly"
#         @fake_results = [double('Task'), double('Task')]
#         Task.stub(:find).and_return(@fake_results)
#     end
#     it "shows task by ID"
#         task1 = Task.create(id: "11")
#         get :show, id: task1.id
#         expect(response).to render_template(:show)
#     end
#    end
#    describe "GET index" do
#     it 'finds all tasks' do
#       get :index
#       expect(response).to render_template(:index)
#     end
#   end
#   describe "GET edit" do
#     it 'edit an existing task' do
#       @fake_results = [double('Task'), double('Task')]
#       Task.stub(:find).and_return(@fake_results)
#       #task = Task.create(id: "12")
#       #get :edit, id: task.id
#       #expect(response).to render_template('edit')
#     end
#   end


  
# end



