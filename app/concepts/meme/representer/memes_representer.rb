require 'roar/decorator'
require 'roar/json'
require 'roar/json/json_api'

class MemesRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :memes

  attributes do
    property :url, getter: ->(represented:, **) {represented.file.url}
    property :title
  end
end
