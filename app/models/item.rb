class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :fee_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: {only_integer: true, in: 300..9_999_999},
             format: {with: /\A[0-9]+\z/, message: "must be half‑width numeric"}

  belongs_to :user
  has_one_attached :image
  # has_one    :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :delivery_time
end
