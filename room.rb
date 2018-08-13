class Room

  attr_reader :name, :playlist, :till
  attr_writer :playlist, :till

  def initialize(name, playlist, till)
    @name = name
    @fee =
    if @name == "small"
      30
    else
      60
    end
    @guests = []
    @playlist = []
    @capacity =
    5 if @name == "small"
    10 if @name == "large"
    @till = till
  end


  def guests_count
    return @guests.length()
  end

  def can_afford_fee?(guest)
    return guest.wallet >= @fee
  end

  # def availability_check(room)
  #   if @capacity > room.guests_count
  #     return "Join in!"
  #   else
  #     return "This room is now full."
  #   end
  # end
  ##updating to true, false for new check_in method
  def space_available?(room)
    return @capacity > room.guests_count
  end


  # def check_in(guest)
  #   @guests.push(guest)
  # end
  ##updated check_in to include fee affordability and capacity
  def check_in(room, guest)
    if space_available?(room) && can_afford_fee?(guest)
      @guests.push(guest)
      # fee from guest.wallet to room.till
      guest.wallet -= @fee
      @till += @fee
      return "Have fun!"
    elsif !space_available?(room)
      return "This room is now full."
    elsif !can_afford_fee?(guest)
      return "You can't afford CCC at the moment."
    else
      return "Check-in not available."
    end
  end


  def check_out(guest)
    @guests.delete(guest)
  end

  def playlist_length
    return @playlist.length()
  end

  # ##QUESTION room as parameter
  def add_song(song)
    @playlist.push(song)
  end

  def check_fav_song(guest)
    if @playlist.include?(guest.song)
      return "OMG that's my song!"
    else
      return "Meh"
    end
  end


end
