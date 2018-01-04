defmodule TelegramBot.Updater do
  use GenServer

  # Client
  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state, name: TelegramBotUpdater)
  end

  # Server
  def init(initial_state) do
    fetch_updates()
    {:ok, initial_state}
  end

  def handle_info(:get_updates, {_, offset} = state) do
    fetch_updates()
    state =
      case Nadia.get_updates(allowed_updates: ["message"], offset: offset) do
        {:ok, []} ->
          IO.puts "Reading updates: No new Update"
          state
        {:ok, updates} ->
          IO.puts "Got #{length(updates)} updates"
          {0, offset + length(updates)}
        _ ->
          state
      end
    {:noreply, state}
  end

  defp fetch_updates() do
    Process.send_after(TelegramBotUpdater, :get_updates, 200)
  end

end
