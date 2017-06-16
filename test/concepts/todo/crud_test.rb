require 'test_helper'

class TodoCrudTest < MiniTest::Spec
  describe 'Create' do
    it 'refuses non logged users' do
      todo = Todo::Create.({}, current_user: nil)

      todo.success?.must_equal false
      todo["result.policy.default"].success?.must_equal false
    end

    it 'validates numericality of body' do
      todo = Todo::Create.({ todo: {title: 'no', body: 'way jose'}}, current_user: 'oie')

      todo.success?.must_equal false
      todo["result.contract.default"].errors.messages.must_equal({body: ["is not a number"]})
    end

    it 'persists' do
      todo = Todo::Create.({ todo: {title: 'no', body: 234}}, current_user: 'oie')

      todo.success?.must_equal true
      todo["model"].persisted?.must_equal true
    end
  end
end
