class Task < ActiveRecord::Base
  belongs_to :user

  # validates :name, :hours, :location, :price, :description :presence => true
  
end
