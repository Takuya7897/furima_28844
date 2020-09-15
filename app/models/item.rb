class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Associations
  has_one :customer
  has_many :comments

  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :ship_cost
  belongs_to_active_hash :ship_date
  # // Associations

  # validates
  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :prefecture_code_id
    validates :ship_cost_id
    validates :ship_date_id
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :prefecture_code_id
    validates :ship_cost_id
    validates :ship_date_id
  end
  validates_inclusion_of :price, in: 300..9_999_999
  # // validates
end
