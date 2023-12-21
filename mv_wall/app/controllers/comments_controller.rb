class CommentsController < ApplicationController
  def save_comment
    validations = "Comment can't be blank" if comment_params.values.any? { |value| value.nil? || value.empty? }

    if validations.nil?
      comment = Comment.save_comment(comment_params)
      flash[:notice] = 'Comment Added' if comment.present?
    else
      flash[:notice] = validations
    end
    redirect_to '/blog'
  end

  def edit_page
    @user = session[:user]
    @comment = Comment.get_comment(params[:id])
  end

  def update_comment
    validations = "Comment can't be blank" if comment_params.values.any? { |value| value.nil? || value.empty? }

    if validations.nil?
      comment = Comment.update_comment(comment_params)
      flash[:notice] = 'Comment updated' if comment.present?
    else
      flash[:notice] = validations
    end
    redirect_to '/blog'
  end

  def delete_comment
    validations = Comment.validate_delete(comment_delete)

    if validations.empty?
      flash[:notice] = 'Comment not Found/Contact Author'
    else
      Comment.delete(comment_delete)
      flash[:notice] = "Comment Deleted"
    end
    redirect_to '/blog'
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message_id, :content)
  end

  def comment_delete
    params.require(:comment_delete).permit(:comment_id, :user_id)
  end
end
