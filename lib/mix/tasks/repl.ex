defmodule Mix.Tasks.Repl do
  use Mix.Task

  alias Share.REPL

  def run(_) do
    REPL.run()
  end
end