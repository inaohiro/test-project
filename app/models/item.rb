class Item < ApplicationRecord
  belongs_to :token
  validates :name, uniqueness: { scope: :token_id }
end
