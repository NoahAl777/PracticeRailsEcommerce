module CommentsHelper
  def belongs_to_post?
    params[:post_id] && @post = Post.find_by_id(params[:post_id])
  end
  
  def current_comment
    @comment = Comment.find_by_id(params[:id])
  end
end
