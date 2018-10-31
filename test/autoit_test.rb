require "test_helper"
require "byebug"

class AutoitTest < Minitest::Test
  
  include AutoIt
  
  @@control = Control.new

  def test_that_it_has_a_version_number
    refute_nil ::Autoit::VERSION
  end

  def test_ai_is_ai
    assert_equal @@control.class, Control
  end

  def test_open_app
    assert @@control.open_app("calc") > 1
  end
end
