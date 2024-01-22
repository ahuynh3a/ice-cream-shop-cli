require 'minitest/autorun'
require './ice_cream_shop'


class IceCreamShopTest < Minitest::Test
  def setup
    @ice_cream_shop = IceCreamShop.new
    @ice_cream_shop.instance_variable_set(:@order, { 'chocolate' => 2, 'vanilla' => 1 })
  end

  def test_display_order
    expected_output = "\nYour order summary:\n2 scoops of chocolate ice cream\n1 scoops of vanilla ice cream\n"
    output, _error = capture_io do
      @ice_cream_shop.display_order
    end
    assert_equal(expected_output, output, "Display order method failed")
  end
end
