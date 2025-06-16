class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_one_attached :icon_image
  has_many :posts, dependent: :destroy
end
