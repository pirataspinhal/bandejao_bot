defmodule USPTest do
  use ExUnit.Case
  doctest USP

  test "greets the world" do
    assert USP.hello() == :world
  end
end
