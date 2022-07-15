require 'rails_helper'

RSpec.describe User, type: :model do
  author_1 = User.create(name: 'John Doe') 
  author_2 = User.create() 

  5.times do |i|
    Post.create(title: "Post #{i}", author: author_1)
  end
  
  it 'should have a name' do
    expect(author_1.name).to eq('John Doe')
  end

  it 'a user with name should be valid' do
    expect(author_1).to be_valid
  end

  it 'a user without a name should be invalid' do
    expect(author_2).not_to be_valid
  end

  it 'return the 3 recent posts of the user' do
    top_3_posts = author_1.top_three_recent_posts
    expect(top_3_posts.length).to eq(3)
  end
end