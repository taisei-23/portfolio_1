class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  has_one_attached :image
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[title body created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "user", "comments", "image_attachment", "image_blob" ]
  end

  def self.search(query)
    where("title ILIKE :query OR body ILIKE :query", query: "%#{query}%")
  end
end
