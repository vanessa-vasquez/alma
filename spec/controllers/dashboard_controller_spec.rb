require 'rails_helper'

describe DashboardController do 
    describe "Create #create" do
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:user]
        end
        
        describe 'user is signed in' do
            let!(:user) {User.create!({id: 40, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University'})}
            it "checks if user is signed in and redirects" do
                user1 = User.create(email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University')
                sign_in user1
                get :index
                expect(response).to redirect_to(tasks_path)
            end
        end

        describe 'user is signed out' do
            it 'redirects to root' do
                get :index
                expect(response).to have_http_status(:ok)
            end
        end
    end
end

