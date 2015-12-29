class Comment < ActiveRecord::Base
    validates :post_id, presence: true
    
    belongs_to :post
end
