class User < ApplicationRecord
  before_create :set_api_key
  validates :email, uniqueness: { case_sensitive: false }

  validates_presence_of :email,
                        :password,
                        :password_confirmation
                        
  has_secure_password

  def set_api_key
    self.api_key = SecureRandom.base58(24)
  end

end
