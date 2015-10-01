class CommentsController < ApplicationController
  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
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

  private
    def comment_params
      params.require(:comment).permit(:body, :article_id, :first_name)
    end

end
