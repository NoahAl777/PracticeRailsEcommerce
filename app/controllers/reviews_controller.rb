class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in
  include ReviewsHelper
  def index
    if belongs_to_post?
      @reviews = @post.reviews
    else
    @reviews = Review.all
    end
  end

  def new
     if belongs_to_post?
      @post = Post.find_by_id(params[:post_id])
      @review = @post.reviews.build
     else
       redirect_to posts_path
     end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    current_review
  end

  def edit
    current_review
  end

  def update
    current_review
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :post_id)
  end
  
end

