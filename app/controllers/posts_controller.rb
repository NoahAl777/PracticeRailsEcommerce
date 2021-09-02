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
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      @post.update(post_params)
      if @post.save
        # redirect to show page
        redirect_to post_path(@post)
      else
        # redirect them to the edit post page again
        render :edit
      end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
  # strong params
  def post_params #will require these params and permit only these are editted by users in the front end
    params.require(:post).permit(:title, :price, :content)
  end

end
