defmodule GroundhogTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Groundhog

  @error "not a valid function\n"

  test "error: not a function" do
    assert @error == capture_io(fn -> schedule("test") end)
  end

  test "error: not zero arity" do
    assert @error == capture_io(fn -> schedule(fn _ -> DateTime.utc_now end) end)
  end

  test "start task" do
    assert match?({:ok, _pid}, schedule(fn -> DateTime.utc_now end))
  end
end
