class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 2 }

  def self.authenticate_with_credentials
    email: email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
