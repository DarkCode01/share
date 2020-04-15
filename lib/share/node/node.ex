defmodule Share.Node do
  @moduledoc """
  Is a module to create custome node to share all files on network.
  """

  @hostname Application.get_env(:share, :hostname)

  defstruct [:pid, :name, :hostname, :secret]

  def me(), do: Node.self()

  def create([name: name, secret: secret]) when is_atom(secret) do
    GenServer.cast(
      Share.Server, {:update, %Share.Node{
        pid: nil, name: name, hostname: @hostname, secret: secret
      }}
    )
    
    # Craete node and add new secret || cookie.
    Share.Node.create_node
    Share.Node.setup_node
  end

  def create_node do
    share_node = GenServer.call(Share.Server, :get)
    {:ok, pid} = Node.start(:"#{share_node.name}@#{share_node.hostname}", :shortnames)

    GenServer.cast(Share.Server, {:update, :pid, pid})
  end

  def setup_node do
    share_node = GenServer.call(Share.Server, :get)
    Node.set_cookie(share_node.secret)
  end

  def connect_node(name: name, hostname: hostname) do
    Node.connect(:"#{name}@#{hostname}")
  end

  def set_secret(secret) when is_atom(secret) do
    Node.set_cookie(secret)
    GenServer.cast(Share.Server, {:update, :secret, secret})
  end
end