defmodule Groundhog.Server do
  use GenServer

  @day_in_ms 24 * 60 * 60 * 1000

  def start_link(function) do
    GenServer.start_link(__MODULE__, function)
  end

  def init(function) do
    Process.send(self(), :run_task, [])
    {:ok, function}
  end

  def handle_info(:run_task, function) do
    spawn_link(function)
    schedule_task()
    {:noreply, function}
  end

  defp schedule_task do
    Process.send_after(self(), :run_task, @day_in_ms)
  end
end

