class CodeSnippetsController < ApplicationController
  def index
    @code_snippets = CodeSnippet.all
  end

  def show
    @code_snippet = CodeSnippet.includes(:comments).find(params[:id])
  end

  def new
    @code_snippet = CodeSnippet.new
  end

  def create
    @code_snippet = CodeSnippet.new(snippet_params)
    @code_snippet.user = current_user
    if @code_snippet.save
      flash[:success] = 'Snippet uploaded successfully!'
      redirect_to code_snippet_path(@code_snippet)
    else
      flash[:error] = 'Failed to upload snippet! Please try again'
      redirect_to new_code_snippet_path
    end
  end

  def edit
    @code_snippet = CodeSnippet.find(params[:id])
  end

  def update
    @code_snippet = CodeSnippet.find(params[:id])

    if @code_snippet.update(snippet_params)
      flash[:success] = 'Snippet updated successfully!'
      redirect_to code_snippet_path(@code_snippet)
    else
      flash[:error] = 'Failed to update snippet! Please try again'
      render :edit
    end
  end

  private

  def snippet_params
    params.require(:code_snippet).permit(:title, :description, :code, :language)
  end
end
