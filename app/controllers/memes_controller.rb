class MemesController < ApplicationController
  def index
    render json: {urls: [
      "https://img-9gag-fun.9cache.com/photo/aRj6V6q_460s.jpg",
      "https://img-9gag-fun.9cache.com/photo/aeeKpjm_460s.jpg",
      "https://img-9gag-fun.9cache.com/photo/aeeKjXb_460s.jpg"
      ]
    }
  end
end
