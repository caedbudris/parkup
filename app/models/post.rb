class Post < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 8, maximum: 80 }
    VALID_LINK_REGEX = /https?:\/\/[\S]+/
    validates :link, format: { with: VALID_LINK_REGEX }, allow_nil: true
    validates :category, presence: true
    
    has_many :comments
    
end
