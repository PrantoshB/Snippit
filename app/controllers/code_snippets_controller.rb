class CodeSnippetsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]

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
      flash[:success] = 'Snippet has been uploaded.'
      redirect_to code_snippet_path(@code_snippet)
    else
      errors = @code_snippet.errors.full_messages
      flash[:error] = "#{errors}. Please try again."
      render :edit
    end
  end

  def destroy
    @code_snippet = CodeSnippet.find(params[:id])
    @code_snippet.destroy

    flash[:success] = 'Your snippet has been removed.'
    redirect_to code_snippets_path
  end

  private

  def snippet_params
    params.require(:code_snippet).permit(:title, :description, :code, :language)
  end
end
