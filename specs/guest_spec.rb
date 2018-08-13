require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../room.rb")

class GuestTest < MiniTest::Test

  def setup
    @song1 = Song.new("Title1")
    @song2 = Song.new("Title2")
    @song3 = Song.new("Title3")
    @guest1 = Guest.new(@song1, 50)
    @guest2 = Guest.new(@song2, 50)
    @guest3 = Guest.new(@song3, 50)
  end


  def test_guest_has_money
    assert_equal(50, @guest1.wallet)
  end












end
