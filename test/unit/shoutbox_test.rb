require 'test_helper'

class ShoutboxTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Shoutbox.new.valid?
  end
end
