class ContributorsController < ApplicationController
  def index
    @contributors = User.all
  end

  def show
    @contributor = User.find(params[:id])
    @starred_code_snippets = CodeSnippet.starred_by(@contributor)
    @bookmarked_code_snippets = CodeSnippet.bookmarked_by(@contributor)
  end

  def edit
    @contributor = User.find(params[:id])
  end

  def update
    @contributor = User.find(params[:id])

    if @contributor.update(contributor_params)
      flash[:success] = 'Contributor updated successfully!'
      redirect_to contributor_path(@contributor)
    else
      flash[:error] = 'Failed to update contributor! Please try again'
      render :edit
    end
  end
end
