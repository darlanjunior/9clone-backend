class MemesController < ApplicationController
  def index
    result = Meme::List.(params, page: 1, items_per_page: 5)
    p result
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
