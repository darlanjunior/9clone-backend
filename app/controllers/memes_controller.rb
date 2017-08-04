class MemesController < ApplicationController
  def index
    result = Meme::List.(params)
    render json: result['result.json']
  end

  def create
    param = params.permit(:title, :file)
    m = Meme.new
    m.file = params[:file]
    m.title = params[:title]
    render json: {result: m.save}
  end
end
