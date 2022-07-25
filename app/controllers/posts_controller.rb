class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id]).references(:posts)
    @author = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    post = Post.new(params[:post].permit(:title, :text))
    post.author = current_user
    if post.save
      flash[:notice] = 'Post was created successfully.'
      redirect_to user_posts_path(current_user, post)
    else
      flash.now[:error] = 'Post was not created.'
      render :show
    end
  end
end
