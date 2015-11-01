require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   let(:rating) { Rating.create!(name: 'PG') }
 
   it { should belong_to :ratingable }
   it { should have_many :rates }
   it { should have_many :topics }
   it { should have_many :posts }

   describe "ratingable" do
     it "allows the same rating to be associated with a different topic and post" do
       topic.ratings << rating
       post.ratings << rating
 
       topic_rating = topic.ratings[0]
       post_rating = post.ratings[0]
 # #11
       expect(topic_rating).to eql(post_rating)
     end
   end
 end