defmodule TelegramBot.Server do
  use GenServer
  alias TelegramBot.Impl

  def init(initial_state) do
    {:ok, Impl.init(initial_state)}
  end

  def handle_cast({:send_message, message}, state) do
    Impl.send_message(message)
    {:noreply, state}
  end

end
