class User < ApplicationRecord
  before_save { self.name = name.downcase }
#  VALID_NAME_REGEX = /\A[\W+\-]+\z/i
#  validates :name, presence: true,
#                   length: { maximum: 50, minimum: 2 },
#                   format: { with: VALID_NAME_REGEX },
#                   uniqueness: { case_sensitive: false }
  validates :name, presence: true,
                   length: { maximum: 50, minimum: 2 },
                   format: { with: /\A[\w-]+\z/i }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
