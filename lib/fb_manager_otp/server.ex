defmodule FbManagerOtp.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :fb_manager)
  end

  # api

  def add(name) do
    GenServer.cast(:fb_manager, {:add, name})
  end

  def remove(name) do
    GenServer.cast(:fb_manager, {:remove, name})
  end

  def team() do
    GenServer.call(:fb_manager, :team)
  end

  # callbacks

  def init([]) do
    {:ok, %{}}
  end

  def handle_cast({:add, name}, state) do
    client = FFNerd.Client.new("hrqevq4h55mt")
    player = FFNerd.Player.find(name, client)
    new_state = Map.put(state, name, player)    
    {:noreply, new_state}
  end

  def handle_cast({:remove, name}, state) do
    new_state = Map.delete(state, name)
    {:noreply, new_state}
  end

  def handle_call(:team, _from, state) do
    {:reply, state, state}
  end
end