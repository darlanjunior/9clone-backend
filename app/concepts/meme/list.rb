require_relative './representer/memes_representer'
class Meme::List < Trailblazer::Operation
  step Policy::Guard( :authorize )
  # step MemesRepresenter.for_collection.prepare(Meme.all).to_json
end
