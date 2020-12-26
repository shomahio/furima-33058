class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_place

  validates :name, :explanation,  presence: true
  validates :category_id,   numericality: { other_than: 1 } 
  validates :charge,        numericality: { other_than: 1 } 
  validates :prefecture,    numericality: { other_than: 1 } 
  validates :shipping_day,  numericality: { other_than: 1 } 
  validates :hipping_place, numericality: { other_than: 1 } 
end
