class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to  article_path(@article), notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :current_user, :first_name)
    end

end
