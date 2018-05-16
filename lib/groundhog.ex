defmodule Groundhog do
  @moduledoc """
  This is a simple application for running scheduled daily tasks.
  
  Simply wrap your task in a zero-arity anonymous function and Bob's your uncle!
  
  Example:
  ```elixir
  Groundhog.schedule(fn -> IO.puts "Then put your little hand in mine..." end)
  ```
  """

  def schedule(task) when is_function(task, 0) do
    {:ok, _pid} = DynamicSupervisor.start_child(Groundhog.Supervisor, {Groundhog.Server, task})
  end

  def schedule(_) do
    IO.puts("not a valid function")
  end
end
