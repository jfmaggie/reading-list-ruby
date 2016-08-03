class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true, email: true
  validates :password, presence: true, length: { minimum: 6 }

  after_validation :hash_password

  private

  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end

end
