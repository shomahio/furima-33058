class Address < ApplicationRecord
  belongs_to :order
  
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :tel
    validates :prefecture_id, numericality: { other_than: 1 } 
  end
end
