defmodule Share.REPL do
  @node_name Share.Utils.get_username
  @node_secret Share.Utils.generate_secret
  @prompt ">> "

  require Logger

  def run do
    generate_node()
    loop()
  end

  def loop do
    command = IO.gets(@prompt)
    procces(command)
    Logger.info command
    loop()
  end

  def procces("clear") do
    IO.puts IO.ANSI.clear
  end

  def generate_node do
    # {:ok, node_info} = Share.Node.create(name: @node_name, secret: @node_secret)

    Share.Application.start([], [])

    Logger.info "--------------------------------------------------------"
    Logger.info "Node create with name: (#{@node_name})"
    Logger.info "Secret of network/node: (#{@node_secret}) [Not Change]"
    Logger.info "--------------------------------------------------------"
  end
end