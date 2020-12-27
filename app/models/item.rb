class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_place
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :charge_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :shipping_place_id
    end
    validates :price,         format: { with: /\A[0-9]+\z/, message: '半角文字で入力してください' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  end
end
