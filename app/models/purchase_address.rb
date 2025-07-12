class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building, :phone, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, phone: phone, purchase_id: purchase.id)
  end
end