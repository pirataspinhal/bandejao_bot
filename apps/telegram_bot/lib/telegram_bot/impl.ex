defmodule TelegramBot.Impl do

  def init(state) do
    state
  end

  def send_message(message) do
    my_chat_id = 41_487_359
    Nadia.send_message(my_chat_id, message)
  end

end
