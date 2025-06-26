class Mountain < ApplicationRecord
  has_many :mountain_searches, dependent: :destroy
  has_many :users, through: :mountain_searches
end
