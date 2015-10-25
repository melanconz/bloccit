class Topic < ActiveRecord::Base
    has_many :sponsored_posts, dependent: :destroy
end
