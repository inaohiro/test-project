class Token < ApplicationRecord
  has_many :items
  has_one :location
  has_one :notification, :dependent => :destroy
  #validates :hashed_token, presence: true
  validates :token, presence: true

  def self.hash(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end

  def generate
    SecureRandom.urlsafe_base64
  end

  def authenticated?(token)
    BCrypt::Password.new(hashed_token).is_password?(token)
  end
end
