
class User < ActiveRecord::Base
  has_many :posts 
  has_many :comments, through: :posts
  validates_uniqueness_of :username
  validates_presence_of :username, :email

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
