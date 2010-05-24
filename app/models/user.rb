class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable:trackable, :registerable,
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable

  validates_presence_of :name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name
end
