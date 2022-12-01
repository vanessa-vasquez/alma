class Task < ActiveRecord::Base
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  belongs_to :user

  validates :name, :hours, :location, :price, :description, :presence => true
  validates :hours, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 } 


  def self.find_tasks(school, pay)
    if (pay == nil)
      return Task.joins(:user).where(:users => {school: school})
    else
      if (pay == "less_than_20")
        return Task.joins(:user).where(:users => {school: school}, :price => -1...20, :accepted => false)
      elsif (pay == "20-50")
        return Task.joins(:user).where(:users => {school: school}, :price => 20..50, :accepted => false)
      else
        return Task.joins(:user).where(:users => {school: school}, :price => 50...Float::INFINITY, :accepted => false)
      end 
    end
  end
end
