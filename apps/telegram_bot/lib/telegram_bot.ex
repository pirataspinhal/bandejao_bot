defmodule TelegramBot do
  @moduledoc """
  This module handles the telegram connectivity as well as messages and other
  Telegram related bureocracy.
  """
  use GenServer

  def start_link(initial_state \\ %{}) do
    GenServer.start_link(TelegramBot.Server, initial_state, name: TelegramBotServer)
  end

  def send_message(message \\ "") do
    GenServer.cast(TelegramBotServer, {:send_message, message})
  end
end
