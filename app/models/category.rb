class Category < ApplicationRecord
  validates :title, uniqueness: true
  has_many :posts
end
