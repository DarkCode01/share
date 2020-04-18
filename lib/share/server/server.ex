defmodule Share.Server do
  @moduledoc false
  
  use GenServer

  @doc false
  def init(state) do
    {:ok, state}
  end

  @doc false
  def start_link([]) do
    GenServer.start_link(__MODULE__, %Share.Node{}, name: __MODULE__)
  end

  @doc false
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end
  
  @doc false
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  @doc false
  def handle_cast({:update, values}, state) do
    {:noreply, Map.merge(state, values)}
  end
  
  @doc false
  def handle_cast({:update, :pid, value}, state) do
    {:noreply, %Share.Node{state | pid: value}}
  end
  
  @doc false
  def handle_cast({:update, :name, value}, state) do
    {:noreply, %Share.Node{state | name: value}}
  end
  
  @doc false
  def handle_cast({:update, :hostname, value}, state) do
    {:noreply, %Share.Node{state | hostname: value}}
  end
  
  @doc false
  def handle_cast({:update, :secret, value}, state) do
    {:noreply, %Share.Node{state | secret: value}}
  end
end