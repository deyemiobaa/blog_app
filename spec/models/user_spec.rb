require 'rails_helper'

RSpec.describe User, type: :model do
  author1 = User.create(name: 'John Doe')
  author2 = User.create

  5.times do |i|
    Post.create(title: "Post #{i}", author: author1)
  end

  it 'should have a name' do
    expect(author1.name).to eq('John Doe')
  end

  it 'a user with name should be valid' do
    expect(author1).to be_valid
  end

  it 'a user without a name should be invalid' do
    expect(author2).not_to be_valid
  end

  it 'return the 3 recent posts of the user' do
    top_3_posts = author1.top_three_recent_posts
    expect(top_3_posts.length).to eq(3)
  end
end
