require 'rails_helper'

RSpec.describe TasksController, type: :controller do
   describe "GET show" do 
    it "shows find correctly"
        @fake_results = [double('Task'), double('Task')]
        Task.stub(:find).and_return(@fake_results)
    end
    it "shows task by ID"
        task1 = Task.create(id: "11")
        get :show, id: task1.id
        expect(response).to render_template(:show)
    end
   end
   describe "GET index" do
    it 'finds all tasks' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe "GET edit" do
    it 'edit an existing task' do
      @fake_results = [double('Task'), double('Task')]
      Task.stub(:find).and_return(@fake_results)
      #task = Task.create(id: "12")
      #get :edit, id: task.id
      #expect(response).to render_template('edit')
    end
  end
  
end