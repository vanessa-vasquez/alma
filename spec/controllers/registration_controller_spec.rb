require 'rails_helper'

describe Users::RegistrationsController do 
    describe "Create #create" do
    let!(:user) {User.create!({id: 40, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University'})}

        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:user]
            sign_in user
        end
    end
end

