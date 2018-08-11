require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../song.rb")
# require_relative("../guest.rb")
# require_relative("../room.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Title1")
    @song2 = Song.new("Title2")
    @song3 = Song.new("Title3")
  end

  def test_song_has_title
    assert_equal("Title1", @song1.title)
  end





end
