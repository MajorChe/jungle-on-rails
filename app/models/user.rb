class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 2 }
  validates :password_confirmation, presence: true, length: { minimum: 2 }

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    end
    nil
  end
  
end
