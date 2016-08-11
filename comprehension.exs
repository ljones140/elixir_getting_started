# Basic comprehension
# iex> for n <- 1..4, do: n * n
# [1, 4, 9, 16]
#
# cartesian comprehension
# iex> for i <- [:a, :b, :c], j <- [1, 2], do:  {i, j}
# [a: 1, a: 2, b: 1, b: 2, c: 1, c: 2]

# pythagorean comprehension
defmodule Triple do
  def pythagorean(n) when n > 0 do
    for a <- 1..n,
        b <- 1..n,
        c <- 1..n,
        a + b + c <= n,
        a*a + b*b == c*c,
        do: {a, b, c}
  end
end
