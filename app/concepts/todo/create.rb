
require_relative "./contract/create"
class Todo::Create < Trailblazer::Operation
  step Policy::Guard( :authorize )
  step Model(Todo, :new)
  step Contract::Build(constant: Todo::Contract::Create)
  step Contract::Validate( key: :todo )
  step Contract::Persist()

  def authorize(options, current_user:, **)
    !current_user.blank?
  end

  def check(options)
    p options
    true
  end

end
