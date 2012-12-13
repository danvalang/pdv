class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  attr_accessible :nombre,:password,:email,:password_confirmation
  attr_protected :is_admin
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"    
  validates_presence_of :email
  validates_uniqueness_of :email
   before_create { generate_token(:auth_token) }
  

  def generate_token(column='auth_token')
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
