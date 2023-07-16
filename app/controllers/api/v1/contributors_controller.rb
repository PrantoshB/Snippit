class Api::V1::ContributorsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @contributors = User.all
    render json: @contributors
  end

  def show
    @contributor = User.find(params[:id])
    render json: @contributor
  end
end
