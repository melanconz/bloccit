class Rating < ActiveRecord::Base
    has_many :topics
    has_many :posts
 
    def self.update_rating(rating_string)
     new_ratings = []
     
     unless rating_string.nil? || rating_string.empty?
       rating_string.each do |rating|
       rating_name = rating.strip
       new_rating = Rating.find_or_create_by(name: rating_name)
       new_ratings << new_rating
      end
     end
     new_rating
    end
    
    enum severity: [ :PG, :PG13, :R]
end
