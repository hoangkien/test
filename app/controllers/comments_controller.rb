class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = User.find_by_username(session[:username])
    @comment.save!

    respond_to do |format|
      format.html { redirect_to @article}
      format.js { render :action =>"create"}#render to comments/create.js.erb
    end
  end

  def destroy
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
