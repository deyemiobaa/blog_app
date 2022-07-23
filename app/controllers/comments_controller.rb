class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post_author = post.author

    comment = Comment.new(params[:comment].permit(:text))
    comment.author = current_user
    comment.post = post
    if comment.save
      flash[:notice] = "Comment was added successfully."
      redirect_to user_post_path(post_author, post)
    else
      flash.now[:error] = "Comment was not added."
    end
  end
end