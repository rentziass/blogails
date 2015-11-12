class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment
      @comment.destroy
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :current_user, :first_name)
  end
  
end
