class Admin::CommentsController < ApplicationController
  before_action :set_admin_comment

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to (@comment.post), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @comment
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to (@comment.post), notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  def set_admin_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:email, :text)
  end
end
