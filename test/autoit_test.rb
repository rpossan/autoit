require "test_helper"
require "byebug"

class AutoitTest < Minitest::Test
  i_suck_and_my_tests_are_order_dependent! 
  
  include AutoIt
  
  @@control = Control.new

  def test_that_it_has_a_version_number
    refute_nil ::Autoit::VERSION
  end

  def test_control_is_contol
    assert_equal @@control.class, Control
  end
  
  def test_open_app
    assert @@control.open_app("calc") > 1
  end

  def test_not_open_app
    refute @@control.open_app("foo") > 1
  end

  def test_sum
    @@control.click_on "Calculator", "5", "[ID:135]"
    @@control.click_on "Calculator", "+", "[ID:93]"
    @@control.click_on "Calculator", "5", "[ID:135]"
    @@control.click_on "Calculator", "=", "[ID:121]"
    assert @@control.has_text?("Calculator", "10", true)
  end

end
