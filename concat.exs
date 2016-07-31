# default argument values
defmodule Concat do
  def join(a, b, sep \\ " ") do # sep has a default values of " "
    a <> sep <> b
  end
end

IO.puts Concat.join("Hello", "world")
IO.puts Concat.join("Hello", "world", "_")


# If a function with default values has multiple clauses,
# it is required to create a function head (without an actual body) for declaring defaults:

defmodule Concaty do
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts Concaty.join("Hello", "world")      #=> Hello world
IO.puts Concaty.join("Hello", "world", "_") #=> Hello_world
IO.puts Concaty.join("Hello")               #=> Hello
