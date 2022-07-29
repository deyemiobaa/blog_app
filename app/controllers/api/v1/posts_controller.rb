class Api::V1::PostsController < ApiController
  def index
    @user = @current_user
    if @user
      render json: {
        posts: @user.posts
      }
    else
      render json: {
        message: 'User not found'
      }
    end
  end
end
