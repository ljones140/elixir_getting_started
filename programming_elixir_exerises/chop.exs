defmodule Chop do
  def guess(actual, range) do
    first..last = range
    current_guess = div(first + last, 2)
    print_guess(current_guess)
    check_guess(current_guess, range, actual)
  end

  defp check_guess(actual, _, actual) do
    IO.puts actual
  end

  defp check_guess(current_guess, range, actual) when current_guess > actual do
    first.._ = range
    guess(actual, first..(current_guess - 1))
  end

  defp check_guess(current_guess, range, actual) when current_guess < actual do
    _..last = range
    guess(actual, (current_guess + 1)..last)
  end

  defp print_guess(guess), do: IO.puts "Is it #{guess}"
end
