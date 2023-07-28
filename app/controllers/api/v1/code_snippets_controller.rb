class Api::V1::CodeSnippetsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_code_snippet, only: %i[show update destroy]

  def index
    @code_snippets = CodeSnippet.all
    render json: @code_snippets
  end

  def show
    render json: @code_snippet, include: :comments
  end

  def create
    @code_snippet = CodeSnippet.new(snippet_params)
    @code_snippet.user = current_user

    if @code_snippet.save
      render json: { success: 'Snippet uploaded successfully!', code_snippet: @code_snippet }, status: :created
    else
      render json: { errors: @code_snippet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if current_user == @code_snippet.user
      if @code_snippet.update(snippet_params)
        render json: { success: 'Snippet has been updated.', code_snippet: @code_snippet }
      else
        render json: { errors: @code_snippet.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to update this snippet.' }, status: :unauthorized
    end
  end

  def destroy
    if current_user == @code_snippet.user
      @code_snippet.destroy
      render json: { success: 'Your snippet has been removed.' }
    else
      render json: { error: 'You are not authorized to remove this snippet.' }, status: :unauthorized
    end
  end

  private

  def snippet_params
    params.require(:code_snippet).permit(:title, :description, :code, :language)
  end

  def set_code_snippet
    @code_snippet = CodeSnippet.includes(:comments).find_by(id: params[:id])
    render json: { error: 'Snippet not found.' }, status: :not_found unless @code_snippet
  end
end
