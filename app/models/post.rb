class Post < ApplicationRecord
  belongs_to :category
  validates :content, presence: true, uniqueness: true
end
