class Api::V1::CommentsController < ApiController
  def index
    post = Post.find_by(id: params[:post_id])
    render json: {
      comments: post.comments
    }
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(params[:comment].permit(:text))
    comment.author = current_user
    comment.post = post
    if comment.save
      render json: {
        message: 'Comment was added successfully.'
      }
    else
      render json: {
        message: 'Comment was not added.'
      }
    end
  end
end
