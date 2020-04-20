defmodule ShareUtilsTest do
  use ExUnit.Case

  setup_all do
    name = :os.cmd('whoami')
      |> to_string
      |> String.trim
    hostname = :os.cmd('hostname')
      |> to_string
      |> String.trim

    {:ok, name: name, hostname: hostname}
  end

  test "Get name of machine", state do
    name = Share.Utils.get_username

    assert name == state[:name]
  end

  test "Get hostname of machine", state do
    hostname = Share.Utils.get_hostname

    assert hostname == state[:hostname]
  end
end