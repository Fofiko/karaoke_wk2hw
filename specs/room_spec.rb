require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../room.rb")

class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Title1")
    @song2 = Song.new("Title2")
    @song3 = Song.new("Title3")
    @song4 = Song.new("Title4")
    @song5 = Song.new("Title5")
    @guest1 = Guest.new("One", @song1, 50)
    @guest2 = Guest.new("Two", @song2, 50)
    @guest3 = Guest.new("Three", @song3, 50)
    @room1 = Room.new("small room", [@song1, @song2], 0)
    @room2 = Room.new("large room", [@song4, @song5], 0)
  end


  def test_get_guests_count
    assert_equal(0, @room1.guests_count)
  end


  def test_check_in_guest
    @room1.check_in(@guest1)
    assert_equal(1, @room1.guests_count)
  end

  def test_check_out_guest
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_out(@guest1)
    assert_equal(1, @room1.guests_count)
  end



end
