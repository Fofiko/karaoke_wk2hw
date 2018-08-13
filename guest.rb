class Guest

  attr_reader :song, :wallet
  attr_writer :wallet

  def initialize(song, wallet)
    @song = song
    @wallet = wallet
  end



end
