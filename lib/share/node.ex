defmodule Share.Node do
  @moduledoc """
  Is a module to create custome node to share all files on network.
  """

  defstruct [:pid, :name, :hostname, :secret]

  def create([name: name, secret: secret]) when is_atom(secret) do
    %Share.Node{
      name: name, hostname: Share.Utils.get_hostname, secret: secret
    }
    |> Share.Node.create_node
    |> Share.Node.setup_node
  end

  def create_node(%Share.Node{name: name, hostname: hostname, secret: secret}) do
    {:ok, pid} = Node.start(:"#{name}@#{hostname}")

    %Share.Node{
      pid: pid, name: name, hostname: hostname, secret: secret
    }
  end

  def setup_node(share_node) do
    Node.set_cookie(share_node.secret)

    share_node
  end
end