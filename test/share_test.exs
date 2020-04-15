defmodule ShareTest do
  use ExUnit.Case

  setup_all do
    name = Application.get_env(:share, :name)
    hostname = Application.get_env(:share, :hostname)

    {:ok, name: name, hostname: hostname}
  end

  test "Recive function test" do
    recived? = Share.recive_file(name: "", data: "")

    assert recived? == true
  end
end
