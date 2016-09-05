defmodule Chop do
  def guess(actual, range = low..high) do
    current_guess = div(low + high, 2)
    print_guess(current_guess)
    check_guess(current_guess, range, actual)
  end

  defp check_guess(actual, _, actual) do
    IO.puts actual
  end

  defp check_guess(current_guess, low.._, actual) when current_guess > actual do
    guess(actual, low..(current_guess - 1))
  end

  defp check_guess(current_guess, _..high, actual) when current_guess < actual do
    guess(actual, (current_guess + 1)..high)
  end

  defp print_guess(guess), do: IO.puts "Is it #{guess}"
end
