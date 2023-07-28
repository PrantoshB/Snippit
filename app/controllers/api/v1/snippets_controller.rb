class Api::V1::SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
    render json: @snippets
  end

  def show
    render json: @snippet, include: :comments
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user

    if @snippet.save
      render json: { success: 'Snippet uploaded successfully!', snippet: @snippet }, status: :created
    else
      render json: { errors: @snippet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if current_user == @snippet.user
      if @snippet.update(snippet_params)
        render json: { success: 'Snippet has been updated.', snippet: @snippet }
      else
        render json: { errors: @snippet.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to update this snippet.' }, status: :unauthorized
    end
  end

  def destroy
    if current_user == @snippet.user
      @snippet.destroy
      render json: { success: 'Your snippet has been removed.' }
    else
      render json: { error: 'You are not authorized to remove this snippet.' }, status: :unauthorized
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :description, :code, :language)
  end

  def set_snippet
    @snippet = Snippet.includes(:comments).find_by(id: params[:id])
    render json: { error: 'Snippet not found.' }, status: :not_found unless @snippet
  end
end
