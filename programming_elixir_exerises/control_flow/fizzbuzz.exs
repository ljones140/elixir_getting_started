defmodule Fizzbuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  # with conditional
  # defp fizzbuzz(n) do
  #   cond do
  #     rem(n, 3) == 0 and rem(n, 5) == 0 ->
  #       "FizzBuzz"
  #     rem(n, 3) == 0 ->
  #       "Fizz"
  #     rem(n, 5) == 0 ->
  #       "Buzz"
  #     true ->
  #       n
  #   end
  # end

  # with case
  defp fizzbuzz(n) do
    case { rem(n, 3), rem(n, 5) } do
      { 0, 0 } ->
        "FizzBuzz"
      { 0, _ } -> 
        "Fizz"
      { _, 0 } ->
        "Buzz"
      _ ->
        n
    end
  end
end

