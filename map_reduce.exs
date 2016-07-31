# Recursion is used here to reduce the list to one value
defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end

IO.puts Math.sum_list([1, 2, 3], 0)

# Here we have used recursion to traverse a list, doubling each element and returning a new list.
# The process of taking a list and mapping over it is known as a map algorithm.

defmodule Math do
  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

I0.puts Math.double_each([1,2,3])
