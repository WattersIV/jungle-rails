class User < ActiveRecord::Base 
  has_secure_password
  validates  :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 } 

  def self.authenticate_credientials(email, password) 
    User.find_by(email: email.strip.downcase).try(:authenticate, password)
  end 
end
