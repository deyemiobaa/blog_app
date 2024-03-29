require 'rails_helper'

RSpec.describe 'Test the User show page' do
  before :each do
    @user = User.create(name: 'Jake', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Algeria.')

    # add five posts for the user
    5.times do |i|
      Post.create(author: @user, title: "Post #{i}", text: 'This is my new post')
    end
    visit user_path(@user.id)
  end

  it 'displays users profile picture' do
    find('img[alt="Jake"]')
  end

  it 'displays the username' do
    expect(page).to have_content(@user.name)
  end

  it 'show number of posts written by the user' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'the users bio is visible' do
    expect(page).to have_content(@user.bio)
  end

  it 'only the first three posts is visible' do
    expect(page).to have_content('Post 4')
    expect(page).to have_content('Post 3')
    expect(page).to have_content('Post 2')
    expect(page).to_not have_content('Post 1')
  end

  it 'button to view all posts is visible' do
    find_button('See all posts')
  end

  it 'go to post#show page when a user click to view post' do
    first('.post > a').click
    expect(page).to have_content('Add a new comment')
    find_button('like post')
    expect(page).to have_content('Comments: 0 Likes: 0')
  end

  it 'go to the users post#index page when a user click on view all post' do
    click_button('See all posts')
    expect(page).to have_content(@user.bio)
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end
end
