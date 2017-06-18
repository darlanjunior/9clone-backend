class MemesController < ApplicationController
  def index
    urls = Meme
      .all
      .order(:created_at)
      .reverse
      .map(&:file)
      .map(&:url)

    render json: {urls: urls}
  end

  def create
    param = params.permit(:title, :file)
    m = Meme.new
    m.file = params[:file]
    m.title = params[:title]
    render json: {result: m.save}
  end
end
