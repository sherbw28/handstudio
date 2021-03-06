class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :lyrics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :this, through: :comments, source: :lyric, dependent: :destroy
  
  mount_uploader :img, ImgUploader
  
end