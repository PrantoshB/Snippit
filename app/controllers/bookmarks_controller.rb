class BookmarksController < ApplicationController
    def create 
      @code_snippet = CodeSnippet.find(params[:code_snippet_id])
      @bookmark = current_user.bookmarks.new(code_snippet: @code_snippet)
  
      if @bookmark.save 
        flash[:success] = 'Bookmark added successfully!'
        redirect_to code_snippet_path(@code_snippet)
      else
        flash[:error] = 'Failed to add bookmark! Please try again'
        redirect_to code_snippet_path(@code_snippet)
      end
    end
  
    def destroy 
      @code_snippet = CodeSnippet.find(params[:code_snippet_id])
      @bookmark = Bookmark.find(params[:id])
      if @bookmark.destroy 
        flash[:success] = 'Bookmark removed successfully!'
        redirect_to code_snippet_path(@code_snippet)
      else
        flash[:error] = 'Failed to remove bookmark! Please try again'
        redirect_to code_snippet_path(@code_snippet)
      end
    end

end
