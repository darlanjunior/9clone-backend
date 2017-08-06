class MemesController < ApplicationController
  def index
    result = Meme::List.(params)
    render json: result['result.json']
  end

  def create
    result = Meme::Create.(params)
    render json: result['result.json'], status: result.success? ? :ok : :unprocessable_entity
  end
end
