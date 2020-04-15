defmodule ServerTest do
  use ExUnit.Case

  test "(Share.Server): verify get data of GenServer (Share)" do
    node_info = GenServer.call(Share.Server, :get)

    assert map_size(node_info) == 5
    assert node_info.__struct__ == Share.Node
    assert node_info.__struct__ == %Share.Node{}.__struct__
  end

  test "(Share.Server): update name of node" do
    GenServer.cast(Share.Server, {:update, :name, "new"})
    name = GenServer.call(Share.Server, {:get, :name})

    assert name == "new"
  end

  test "(Share.Server): update hostname of node" do
    GenServer.cast(Share.Server, {:update, :hostname, "new"})
    hostname = GenServer.call(Share.Server, {:get, :hostname})

    assert hostname == "new"
  end

  test "(Share.Server): update pid of node" do
    GenServer.cast(Share.Server, {:update, :pid, :pid})
    pid = GenServer.call(Share.Server, {:get, :pid})

    assert pid == :pid
  end

  test "(Share.Server): update secret of node" do
    GenServer.cast(Share.Server, {:update, :secret, :new})
    secret = GenServer.call(Share.Server, {:get, :secret})

    assert secret == :new
  end
end