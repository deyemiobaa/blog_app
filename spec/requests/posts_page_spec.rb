require 'rails_helper'

RSpec.describe 'Posts Page', type: :request do
  describe 'GET /posts/index' do
    before(:example) { get '/users/1/posts' }
    it 'the path works' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'displays the placeholder text' do
      expect(response.body).to include('Here\'s the homepage to display all posts by a user')
    end
  end

  describe 'GET /posts/show' do
    before(:example) { get '/users/1/posts/1' }
    it 'the path works' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'displays the placeholder text' do
      expect(response.body).to include('This page displays the contents of a post by a user')
    end
  end
end
