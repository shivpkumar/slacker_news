class User < ActiveRecord::Base
  has_many :posts 
  has_many :comments
  has_many :post_votes
  has_many :comment_votes
  validates_uniqueness_of :username
  validates_presence_of :username, :password_hash

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = self.find_by_username(params[:username])
    user && (user.password == params[:password]) ? user : false
  end
end
