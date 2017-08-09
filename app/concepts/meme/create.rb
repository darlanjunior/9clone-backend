require_relative './representer/memes_representer'
class Meme::Create < Trailblazer::Operation
  extend Contract::DSL

  contract do
    property :title
    property :file

    validates :title, presence: true
    validates :file, presence: true
  end

  step Model(Meme, :new)
  step Contract::Build()
  step Contract::Validate()
  failure :handle_validation_errors!
  success Contract::Persist()
  success :represent_result!

  def handle_validation_errors!(options, **)
    options[:'result.json'] = {
      success: false,
      errors: options['result.contract.default'].errors
    }.to_json
  end

  def represent_result!(options, **)
    options[:'result.json'] = {
      success: true,
      errors: []
    }
  end
end
