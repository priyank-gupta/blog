class User < ActiveRecord::Base

  has_many :shayari
  
  validates :name, :presence => true, :length => {:maximum => 30}
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {:maximum => 30}
  validates :password, :confirmation => true, :length => {:in => 4..30}
  validates :gender, :presence => true, :length => {:is => 1}
  attr_accessor :password_confirmation
  attr_reader :password
  
  validate :password_must_be_present
  
  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end
  
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
  
  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end
  
  private
  
  def password_must_be_present
    errors.add(:password, 'Missing Password') unless hashed_password.present?
  end
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
