module Todo::Contract
  class Create < Reform::Form
    include Dry
    property :title
    property :body

    validates :title,  presence: true
    validates :body, numericality: true
  end
end
