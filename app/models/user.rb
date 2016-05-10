class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # If you need to add free registration later :registerable -> add to devise line
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :students
end
