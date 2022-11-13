require 'rails_helper'

RSpec.describe Task, type: :model do
    let!(:user) {User.create!({id: 1, email: 'zg25@columbia.edu', password: 'password123', fname: 'Zeek', lname: 'Roll', school: 'Columbia University', confirmed_at: "2017-05-26 14:00:00 +0800"})}
    let!(:task1) {Task.create!({name: 'Need brownie pan', hours: 3, deadline: DateTime.new(2022,12,6), location: 'Carman Floor 5 Kitchen', price: 3,
    description: 'I am making brownies for my friends and need a pan!', user_id: 1, completed: false})}
    let!(:task2) {Task.create!({name: 'Help moving out', hours: 4, deadline: DateTime.new(2022,12,3), location: 'Woodbridge Hall', price: 30,
    description: 'Need help moving out of my dorm, will buy you lunch', user_id: 1, completed: false})}
    let!(:task3) {Task.create!({id: 3, name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 300, description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false})}

    describe 'filtering movies by pay less than $20' do
        it "should return the correct matches" do
            expect(Task.find_tasks("Columbia University", "less_than_20")).to match_array([task1])
        end 
    end

    describe 'filtering movies by pay between $20 and $50' do
        it "should return the correct matches" do
            expect(Task.find_tasks("Columbia University", "20-50")).to match_array([task2])
        end 
    end

    describe 'filtering movies by pay over $50' do
        it "should return the correct matches" do
            expect(Task.find_tasks("Columbia University", "over_50")).to match_array([task3])
        end  
    end
end

