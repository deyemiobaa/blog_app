class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])

    like = Like.new(params[:like].permit(:post_id))
    like.post = post
    like.author = current_user
    if like.save
      flash[:notice] = 'Like was added successfully.'
      redirect_to user_post_path(post.author, post)
    else
      flash.now[:error] = 'Like was not added.'
    end
  end
end
