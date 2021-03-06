class User < ActiveRecord::Base
    validates :name, uniqueness: true, presence: true, length: { maximum: 24 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    
    mount_uploader :picture, PictureUploader
    
    has_many :posts
    has_many :comments
end
