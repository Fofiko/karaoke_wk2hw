class Room

  attr_reader :name, :playlist, :till

  def initialize(name, playlist, till)
    @name = name
    @fee =
    30 if @name == "small"
    60 if @name == "large"
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

  def check_in(guest)
    @guests.push(guest)
  end

  def check_out(guest)
    @guests.delete(guest)
  end

end
