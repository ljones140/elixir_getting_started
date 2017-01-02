# Exercise: WorkingWithMultipleProcesses-3,4 and 5
# to run:
# `$ elixir -r spawn_link_exercise.exs`

defmodule SpawnLink do
  import :timer, only: [sleep: 1]

  def child_sender(sender) do
    send sender, "hello"
    # Try running with exit and with timeout
    # raise RuntimeError, message: "Did it by purpose"
    # exit(:boom)
  end

  def run do
    # Try running as spawn_link and spawn monitor
    res = spawn_monitor(SpawnLink, :child_sender, [self])
    # res = spawn_link(SpawnLink, :child_sender, [self])
    IO.puts inspect res
    sleep 500
    await_message
  end

  def await_message do
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        await_message
    after 1000 ->
        IO.puts "Receiving function timeout"
    end
  end
end

  SpawnLink.run
