require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../song.rb")
require_relative("../guest.rb")
# require_relative("../room.rb")

class GuestTest < MiniTest::Test

  def setup
    @fav_song1 = Song.new("Title1")
    @fav_song2 = Song.new("Title2")
    @fav_song3 = Song.new("Title3")
    @guest1 = Guest.new(@fav_song1.title, 50)
    @guest2 = Guest.new(@fav_song2.title, 50)
    @guest3 = Guest.new(@fav_song3.title, 50)
  end

  def test_guest_has_fav_song
    assert_equal("Title1", @guest1.fav_song)
  end

  def test_guest_has_money
    assert_equal(50, @guest1.wallet)
  end


end
