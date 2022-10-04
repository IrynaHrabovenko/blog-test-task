class Category < ApplicationRecord
  validates :title, uniqueness: true
  has_many :posts, dependent: :destroy
end
