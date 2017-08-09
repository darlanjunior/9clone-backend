require_relative './representer/memes_representer'
class Meme::List < Trailblazer::Operation
  step :set_variables!
  step Nested( Page::List )
  step :sort!
  step :represent!

  def set_variables!(options, params:, **)
    params[:model] = ::Meme
    params[:searchable_fields] = [:title]
    params[:page] = params[:page] || 1
    params[:items_per_page] = params[:items_per_page] || 5
  end

  def sort!(options, **)
    options[:result] = options[:result].order(created_at: :desc)
  end

  def represent!(options, result:, **)
    options[:'result.json'] = MemesRepresenter.for_collection.new(result).to_json
  end
end
