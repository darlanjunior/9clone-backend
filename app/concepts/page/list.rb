class Page::List < Trailblazer::Operation
  # extend Contract::DSL
  # contract do
  #   property :page
  #   property :items_per_page
  #   property :search_term
  #   property :ordering
  # end

  step :assemble_query!
  step :model!

  def assemble_query!(options, *)
    search_term = options['params']['search_term']

    model = options['model']
    searchable_fields = options['searchable_fields']

    search_params(searchable_fields, search_term)
  end

  def model!(options, *)
    page = options['params']['page']
    items_per_page = options['params']['items_per_page']
    ordering = options['params']['ordering']
    search = options['search']

    model
      .where(search)
      .order(ordering)
      .limit(items_per_page)
      .offset(page*items_per_page)
  end

  private
  def search_params fields, term
    fields.reduce({}) {|acc, f| acc.merge({f => term}) }
  end
end
