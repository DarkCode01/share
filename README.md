# Share

**Share** is a packege to manage [Node](https://hexdocs.pm/elixir/Node.html#content) and can share files between [Node](https://hexdocs.pm/elixir/Node.html#content) in the same network.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `share` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:share, "~> 0.1.0"}
  ]
end
```

### Usage

Creation of a Node:
```elixir
iex> {:ok, node_info} = Share.Node.create(name: "test", secret: :secret)
{:ok,
 %Share.Node{
   hostname: "localhost", # Your hostname
   name: "test",
   pid: #PID<x.x.x>,
   secret: :secret
 }} 
```

Connect with other Node:
```elixir
iex> {:ok, list_others_nodes} = Share.Node.connect_node(name: "test", hostname: "localhost")
{:ok, [:"test@localhost"]}
```

Share a file:
```elixir
iex> :ok = Share.send(to: :"test@localhost", filename: "/path/file")
```

<center>Made with ❤️ by darkcoder.</center>