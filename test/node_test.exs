defmodule ShareNodeTests do
  use ExUnit.Case, async: true

  setup_all do
    name = Application.get_env(:share, :name)
    secret = Application.get_env(:share, :secret)
    hostname = Application.get_env(:share, :hostname)

    {:ok, name: name, secret: secret, hostname: hostname}
  end

  test "Creating new node with module.", state do
    {:ok, node_info} = Share.Node.create(name: state[:name], secret: state[:secret])
    
    assert map_size(node_info) == 5
    assert node_info.__struct__ == Share.Node
    assert node_info.__struct__ == %Share.Node{}.__struct__
  end

  test "Connection to other node on same network.", state do
    connected? = Share.Node.connect_node(name: state[:name] <> "1", hostname: state[:hostname])

    assert connected? == {:ok, []}
  end

  test "Get my identify node", state do
    identify = Share.Node.me

    assert is_atom(identify)
    assert identify == :"#{state[:name]}@#{state[:hostname]}"
  end
end