class Token < ApplicationRecord
  has_many :items
  # after_initialize :set_default, if: :new_record?
  validates :hashed_token, presence: true

  def generate
    SecureRandom.urlsafe_base64
  end

  def hash(token)
    BCrypt::Password.create(token)
  end

  def authenticated?(token)
    BCrypt::Password.new(hashed_token).is_password?(token)
  end

  private
    #def set_default
    #  self.hashed_token ||= Token.hash(Token.new_token)
    #end
end
