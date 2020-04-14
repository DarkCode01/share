defmodule Share.Server do
  use GenServer

  def init(state) do
    {:ok, state}
  end

  def start_link([]) do
    GenServer.start_link(__MODULE__, %Share.Node{}, name: __MODULE__)
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_cast({:update, values}, state) do
    {:noreply, Map.merge(state, values)}
  end
  def handle_cast({:update, :pid, value}, state) do
    {:noreply, %Share.Node{state | pid: value}}
  end
  def handle_cast({:update, :name, value}, state) do
    {:noreply, %Share.Node{state | name: value}}
  end
  def handle_cast({:update, :hostname, value}, state) do
    {:noreply, %Share.Node{state | hostname: value}}
  end
  def handle_cast({:update, :secret, value}, state) do
    {:noreply, %Share.Node{state | secret: value}}
  end
end