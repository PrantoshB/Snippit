class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @snippet = CodeSnippet.find(params[:code_snippet_id])
    @comment = @snippet.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Your comment has been posted.'
    else
      errors = @comment.errors.full_messages
      flash[:error] = "#{errors}. Unable to add comment."
    end
    redirect_to code_snippet_path(@snippet)
  end

  def destroy
    @snippet = CodeSnippet.find(params[:code_snippet_id])
    @comment = @snippet.comments.find(params[:id])
    return unless @comment.destroy

    flash[:success] = 'Your comment has been removed.'
    redirect_back(fallback_location: root_path)
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
