class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lyric
  
  validates :post, presence: true
end
