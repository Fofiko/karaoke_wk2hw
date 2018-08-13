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
    @guest1 = Guest.new(@song1, 30)
    @guest2 = Guest.new(@song2, 50)
    @guest3 = Guest.new(@song3, 50)
    @guest4 = Guest.new(@song1, 50)
    @guest5 = Guest.new(@song2, 50)
    @guest6 = Guest.new(@song3, 50)
    @room1 = Room.new("small", [@song1, @song2], 0)
    @room2 = Room.new("large", [@song4, @song5], 0)
  end


  def test_get_guests_count
    assert_equal(0, @room1.guests_count)
  end

  def test_guest_can_afford_fee__small
    assert_equal(true, @room1.can_afford_fee?(@guest1))
  end

  def test_guest_can_afford_fee__large
    assert_equal(false, @room2.can_afford_fee?(@guest1))
  end


  # def test_check_room_availability__still_space
  #   @room1.check_in(@guest1)
  #   @room1.check_in(@guest2)
  #   assert_equal("Join in!", @room1.availability_check(@room1))
  # end
  #
  # def test_check_room_availability__no_space
  #   @room1.check_in(@guest1)
  #   @room1.check_in(@guest2)
  #   @room1.check_in(@guest3)
  #   @room1.check_in(@guest4)
  #   @room1.check_in(@guest5)
  #   @room1.check_in(@guest6)
  #   assert_equal("This room is now full.", @room1.availability_check(@room1))
  # end

  # def test_check_in_guest
  #   @room1.check_in(@guest1)
  #   assert_equal(1, @room1.guests_count)
  # end
  ##updated check_in to test fee affordability and capacity
  def test_check_in_guest
    @room1.check_in(@room1, @guest1)
    @room1.check_in(@room1, @guest2)
    @room1.check_in(@room1, @guest3)
    assert_equal("Have fun!", @room1.check_in(@room1, @guest4))
  end

  def test_fee_collected
    @room1.check_in(@room1, @guest1)
    assert_equal(30, @room1.till)
  end

  def test_check_out_guest
    @room1.check_in(@room1, @guest1)
    @room1.check_in(@room1, @guest2)
    @room1.check_out(@guest1)
    assert_equal(1, @room1.guests_count)
  end

  def test_room_starts_with_empty_playlist
    assert_equal(0, @room1.playlist_length)
  end

  def test_guest_can_add_song_to_room_playlist
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(2, @room1.playlist_length)
  end

  def test_guest_likes_song__yes
    @room1.add_song(@song1)
    assert_equal("OMG that's my song!", @room1.check_fav_song(@guest1))
  end

  def test_guest_likes_song__no
    @room1.add_song(@song2)
    assert_equal("Meh", @room1.check_fav_song(@guest1))
  end


end
