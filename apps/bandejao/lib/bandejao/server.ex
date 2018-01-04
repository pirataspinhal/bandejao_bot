defmodule BandejaoBot.Server do
  use GenServer

  def start_link() do
    GenServer.start_link(BandejaoBot.Client, [])
  end

end
