class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.include? ".edu"
      record.errors[attribute] << (options[:message] || "is not a university email")
    end
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         has_many :tasks
  validates :email, :presence => true, :email => true
end
