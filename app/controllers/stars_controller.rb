class StarsController < ApplicationController
  def create
    @code_snippet = CodeSnippet.find(params[:code_snippet_id])
    @star = current_user.stars.new(code_snippet: @code_snippet)

    if @star.save
      flash[:success] = 'Star added successfully!'
    else
      flash[:error] = 'Failed to add star! Please try again'
    end
    redirect_to code_snippet_path(@code_snippet)
  end

  def destroy
    @code_snippet = CodeSnippet.find(params[:code_snippet_id])
    @star = Star.find(params[:id])
    if @star.destroy
      flash[:success] = 'Star removed successfully!'
    else
      flash[:error] = 'Failed to remove star! Please try again'
    end
    redirect_to code_snippet_path(@code_snippet)
  end
end
