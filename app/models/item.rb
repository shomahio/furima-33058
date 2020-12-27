class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_place
  has_one_attached :image

  validates :name, :explanation,  presence: true
  validates :category_id,       numericality: { other_than: 1 } 
  validates :charge_id,         numericality: { other_than: 1 } 
  validates :prefecture_id,     numericality: { other_than: 1 } 
  validates :shipping_day_id,   numericality: { other_than: 1 } 
  validates :shipping_place_id, numericality: { other_than: 1 } 
end
