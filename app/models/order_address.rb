class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipalities, :address, :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code,       format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipalities
    validates :address
    validates :tel,               format: { with: /\A\d{10,11}\z/}
    validates :prefecture_id,        numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building)
    # 寄付金の情報を保存
    Order.create(item_id: item_id, user_id: user_id)
  end

end