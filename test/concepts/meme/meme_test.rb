require 'test_helper'

class MemeTest < MiniTest::Spec
  describe '#list' do
    it 'lists all memes on the database' do
      meme = Meme::List.()

      meme.success?.must_equal(true)
    end
  end
end
