class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name_sei, presence: true
  validates :name_mei, presence: true
  validates :kana_sei, presence: true
  validates :kana_mei, presence: true
  validates :birthday, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' 
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
  validates :name_sei
  validates :name_mei
  end

  with_options presence: true, format: { with: /\A[ァ-ヴーー]+\z/u, message: 'is invalid. Input full-width katakana characters' } do
  validates :kana_sei
  validates :kana_mei
  end
  
  has_many :items
  # has_many :purchases
end
