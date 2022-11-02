class Task < ActiveRecord::Base
  include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  belongs_to :user

  validates :name, :hours, :location, :price, :description, :presence => true
  
  # validates_presence_of :name,:message => "Please Provide Task Name"

end
