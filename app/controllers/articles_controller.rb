class ArticlesController < ApplicationController
  def show
    @article = Article.friendly.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @comment = @article.comments.find(params[:id])
    if @comment
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to  article_url, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

end
