class CreateRatings < ActiveRecord::Migration
    def change
        create_table :ratings do |t|
            t.string :name
            t.references :ratingable, polymorphic: true, index: true
            
            t.timestamp null: false
        end
    end
end
