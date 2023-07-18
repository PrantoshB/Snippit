class Api::V1::CodeSnippetsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @code_snippets = CodeSnippet.all
    render json: @code_snippets
  end

  def show
    @code_snippet = CodeSnippet.includes(:comments).find(params[:id])
    render json: @code_snippet
  end

  def create
    @code_snippet = CodeSnippet.new(snippet_params)
    @code_snippet.user = current_user
    if @code_snippet.save
      render json: { success: 'Snippet uploaded successfully!', code_snippet: @code_snippet }, status: :created
    else
      render json: { error: 'Failed to upload snippet! Please try again' }, status: :unprocessable_entity
    end
  end

  def update
    @code_snippet = CodeSnippet.find(params[:id])

    if @code_snippet.update(snippet_params)
      render json: { success: 'Snippet has been updated.', code_snippet: @code_snippet }
    else
      render json: { error: @code_snippet.errors.full_messages.join('. ') }, status: :unprocessable_entity
    end
  end

  def destroy
    @code_snippet = CodeSnippet.find(params[:id])
    @code_snippet.destroy

    if @code_snippet.destroy
      render json: { success: 'Your snippet has been removed.' }
    else
      render json: { error: 'Failed to remove the snippet.' }, status: :unprocessable_entity
    end
  end

  private

  def snippet_params
    params.require(:code_snippet).permit(:title, :description, :code, :language)
  end
end
