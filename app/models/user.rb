class User < ActiveRecord::Base
  has_secure_password
  has_many :fase
  validates_presence_of :password, :on => :create
  attr_accessible :nombre,:password,:email,:password_confirmation
  attr_protected :is_admin
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"    
  validates_presence_of :email, :nombre, :password
  validates_uniqueness_of :email
   before_create { generate_token(:auth_token) }
  

  def generate_token(column='auth_token')
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def all_usernames (*filtered_users)
   filtered_users.collect {|user| user.username}
  end

  def is_admin?
    true if self.is_admin == 1
  end

  def to_s
    nombre.camelcase
  end

  # def fill_up (name, password, email)
  #   unless User.find_by_email("email")
  #     user = User.create
  #     user.nombre  = name
  #     user.password = password
  #     user.password_confirmation = password
  #     user.email = email
  #     user.save
  #   else
  #     false
  #   end
  # end

end
