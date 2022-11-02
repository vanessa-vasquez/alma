require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user model' do
    let!(:user) {User.create!({id: 40, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University'})}
    context "it has a user" do
      it "returns the correct attributes" do
        expect(user.id).to eql(40)
        expect(user.email).to eql('zg25@columbia.edu')
      end
    end

  end



end 
