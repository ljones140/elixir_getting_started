defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (send me, {self, fun.(elem)}) end
       end)
    |> Enum.map(fn (pid) ->
         receive do
           {^pid, result} ->
             result
           end
       end)
  end
end

# Try a really bad implementation of sort
# iex(4)> Parallel.pmap [10,15,2,18,1,9], fn(elem) -> :timer.sleep(elem)
# ...(4)> IO.puts(elem)
# ...(4)> end
#
# Exercise WoringWithMultipleProcesses-7
# After changing line 10 `^pid` to `_pid`
# This use of pmap will expose the receive ordering bug
# iex(3)> Parallel.pmap 1..10, fn(elem) -> :timer.sleep(100 - elem)
# ...(3)> elem * elem
# ...(3)> end
# [100, 81, 64, 49, 36, 25, 16, 9, 4, 1]
