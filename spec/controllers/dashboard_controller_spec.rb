require 'rails_helper'

describe DashboardController do 
    describe "Create #create" do
    let!(:user) {User.create!({id: 40, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University'})}
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:user]
        end
        it "checks if user is signed in" do
            user1 = User.create(email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University')
            sign_in user1
        end
    end
end

