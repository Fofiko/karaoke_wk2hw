class Guest

  attr_reader :song, :wallet, :tab
  attr_writer :wallet, :tab

  def initialize(song, wallet)
    @song = song
    @wallet = wallet
    @tab = 0
  end




end
