class Customer < ApplicationRecord
  # Associations
  belongs_to :item
  belongs_to :user
  has_one :address
  # // Associations

  # validates
  # // validates
end
