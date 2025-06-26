class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_one_attached :icon_image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :mountain_searches, dependent: :destroy
  has_many :mountains, through: :mountain_searches
end
