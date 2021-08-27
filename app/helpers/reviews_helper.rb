module ReviewsHelper
  def belongs_to_post?
    params[:post_id] && @post = Post.find_by_id(params[:post_id])
  end
  
  def current_review
    @review = Review.find_by_id(params[:id])
  end
end
