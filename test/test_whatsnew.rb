require 'minitest_helper'

class TestWhatsnew < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Whatsnew::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
