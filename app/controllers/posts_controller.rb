class PostsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @post = Post.new
  end

  def create
    # instantiates the post with params
    @post = current_user.posts.build(post_params)
    # if post fields pass validations it will save the post
    if @post.save
      # redirect to show page
      redirect_to posts_path
    else
      # redirect them to the new post page again
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def index
    @posts = Post.by_status(:available)
  end

  def update
    @post = Post.find(params[:id])
    @post.buyer_user = current_user
    if @post.accepted_by(current_user)
      redirect_to @post
    else
      render :show
    end
  end

  private
  # strong params
  def post_params #will require these params and permit only these are editted by users in the front end
    params.require(:post).permit(:title, :price, :content)
  end

end
