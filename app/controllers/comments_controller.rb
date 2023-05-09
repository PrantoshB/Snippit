class CommentsController < ApplicationController
    def create
        @snippet = CodeSnippet.find(params[:code_snippet_id])
        @comment = @snippet.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            flash[:success] = 'Comment added successfully!'
            redirect_to code_snippet_path(@snippet)
        else
            errors = @comment.errors.full_messages
            flash[:error] = "#{errors}. Failed to add new comment"
            redirect_to code_snippet_path(@snippet)
        end
    end

    def destroy 
        @snippet = CodeSnippet.find(params[:code_snippet_id])
        @comment = @snippet.comments.find(params[:id])
        if @comment.destroy
            flash[:success] = "Your comment has been removed."
            redirect_back(fallback_location: root_path)
        end
    end


    private 

    def comment_params
        params.require(:comment).permit(:content)
    end
end