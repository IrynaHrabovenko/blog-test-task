class Category < ApplicationRecord
  validates :title, uniqueness: true
  has_many :posts, dependent: :destroy
  scope :by_post_shared_url_presence, -> { joins(:posts).where('posts.shared_url is null').uniq }
end
