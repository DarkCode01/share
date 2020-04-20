defmodule Share.Node do
  @moduledoc """
  Is a module to create custome node to share all files on network.
  """

  @hostname Share.Utils.get_hostname

  defstruct [:pid, :name, :hostname, :secret]

  def me(), do: Node.self()

  def info(), do: GenServer.call(Share.Server, :get)

  def create(name: name, secret: secret) when is_atom(secret) do
    GenServer.cast(
      Share.Server, {:update, %Share.Node{
        pid: nil, name: name,
        hostname: @hostname, secret: secret
      }}
    )
    
    # Craete node and add new secret || cookie.
    create_node()
    setup_node()

    {:ok, info()}
  end

  defp create_node do
    share_node = GenServer.call(Share.Server, :get)
    {:ok, pid} = Node.start(:"#{share_node.name}@#{share_node.hostname}", :shortnames)

    # Changing pid information on GenServer data.
    GenServer.cast(Share.Server, {:update, :pid, pid})
  end

  defp setup_node do
    share_node = GenServer.call(Share.Server, :get)
    Node.set_cookie(share_node.secret)
  end

  def connect_node(name: name, hostname: hostname) do
    Node.connect(:"#{name}@#{hostname}")

    {:ok, Node.list()}
  end
end