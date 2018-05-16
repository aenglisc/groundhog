defmodule GroundhogTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Groundhog

  test "error: not a valid function" do
    assert match?({:error, :not_a_valid_function}, schedule("test"))
    assert match?({:error, :not_a_valid_function}, schedule(fn _ -> DateTime.utc_now end))
  end

  test "start task" do
    assert match?({:ok, _pid}, schedule(fn -> DateTime.utc_now end))
  end
end
