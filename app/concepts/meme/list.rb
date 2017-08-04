require_relative './representer/memes_representer'
class Meme::List < Trailblazer::Operation
  step :set_variables!
  step Nested( Page::List )
  step :represent!

  def set_variables!(options, **)
    options['params']['model'] = ::Meme
    options['params']['searchable_fields'] = [:title]
    options['params']['page'] = 1 if !options['params']['page']
    options['params']['items_per_page'] = 5 if !options['params']['items_per_page']
    p options['params']
  end

  def represent!(options, result:, **)
    options['result.json'] = MemesRepresenter.for_collection.new(result).to_json
  end
end
