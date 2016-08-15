require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  test ".known_keys" do
    
    assert 2, Property.known_keys
  end
end
