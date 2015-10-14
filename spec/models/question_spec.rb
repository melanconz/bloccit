require 'rails_helper'

RSpec.describe Question, type: :model do
 let(:question) { Question.create!(body: "New Question Body", resolved: true) }
 
 describe 'attributes' do
     it "should respond to body" do
         expect(question).to respond_to(:body)
     end
     
     it "should repsond to resolved" do
         expect(question).to respond_to(:resolved)
 end
end
 
