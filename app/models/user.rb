class User < ActiveRecord::Base
  has_many :posts
  
  validates :email, uniqueness: true

  before_save :set_user_password
  
  SALT = "e000c8e7c0876f2dc9e3e60409847e92"

  def self.hash_password(password)
     Digest::SHA2.hexdigest(password+SALT)
  end

  def set_user_password
    self.password = User.hash_password(self.password)
  end

  def self.validate(info)
    user = User.find_by_email(info[:email])
    user_entry = info[:password]
    if user == nil
      nil
    elsif user.password == self.hash_password(user_entry)
      user
    else
      nil
    end
  end
end
