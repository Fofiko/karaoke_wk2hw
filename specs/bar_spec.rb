require("minitest/autorun")
require("minitest/rg")
require_relative("../bar.rb")


class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new
  end


  def test_drink_prices
    assert_equal(3,@bar.drinks["beer"])
    assert_equal(5,@bar.drinks["wine"])
    assert_equal(2,@bar.drinks["tomato_juice"])
  end


end
