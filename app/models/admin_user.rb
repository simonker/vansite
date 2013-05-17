class AdminUser < ActiveRecord::Base
  has_many :vehicles
  
  attr_accessible :first_name, :last_name, :email, :username, :password
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 50 }
  validates :username, :length => { :within => 6..25 }, :uniqueness => true
  validates :email, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true
    
  validates_length_of :password, :within => 6..25, :on => :create
  before_save :create_hashed_password
  after_save :clear_password
  
  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  
  scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")
    def name
      "#{first_name} #{last_name}"
  end
  attr_accessor :password
  
  attr_protected :hashed_password, :salt
  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end
  
  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
  private
  
  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end
end
