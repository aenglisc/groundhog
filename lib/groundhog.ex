defmodule Groundhog do
  @moduledoc """
  This is simple application for running scheduled daily tasks
  Simply wrap your task in a zero-arity anonymous function and Bob's your uncle
  Example: Groundhog.schedule(fn -> DateTime.utc_now end)
  """

  def schedule(task) when is_function(task, 0) do
    {:ok, _pid} = DynamicSupervisor.start_child(Groundhog.Supervisor, {Groundhog.Server, task})
  end

  def schedule(_) do
    IO.puts("not a valid function")
  end
end
