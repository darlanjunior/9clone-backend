require 'test_helper'

class PaginatedListTest < MiniTest::Spec
  describe '#call' do
    it do
      Page::List.(page: 1, items_per_page: 5)
    end
  end
end
