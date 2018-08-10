require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../song.rb")
# require_relative("../guest.rb")
# require_relative("../room.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("ruby tuesday")
  end

  def test_song_has_title
    assert_equal("ruby tuesday", @song1.title)
  end





end
