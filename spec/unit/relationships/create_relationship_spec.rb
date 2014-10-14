# require 'rails_helper'

#   describe Relationship do

#     before :each do 
#       User.create(first_name: "test", last_name: "test", email: "test@gmail.com", password: "12345678", password_confirmation: "12345678")
#       User.create(first_name: "widny", last_name: "st.louis", email: "1234@gmail.com", password: "12345678", password_confirmation: "12345678")
#     end    

#     it 'should create two users, and have one follow the other' do
#       test = User.first
#       widny = User.last
#       expect(Relationship.count).to eq(0)
#       relationship = Relationship.new
#       relationship.followed_id = test.id
#       relationship.save
#       expect(Relationship.count).to eq(1)

#     end

#  end