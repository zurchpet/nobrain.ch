require 'test_helper'

class PrivateMessageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PrivateMessage.new.valid?
  end
end
