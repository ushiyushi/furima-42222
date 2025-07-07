class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building, :phone, :purchase, :user_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    
  end
end