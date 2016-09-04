defmodule Chop do
  def guess(number, range) do
    first..last = range
    current_guess = div(first + last, 2)
    print_guess(current_guess)
    check_guess(current_guess, range, number)
  end

  defp check_guess(current_guess, _, number) when current_guess == number do
    IO.puts current_guess
  end

  defp check_guess(current_guess, range, number) when current_guess > number do
    first.._ = range
    guess(number, first..(current_guess - 1))
  end

  defp check_guess(current_guess, range, number) when current_guess < number do
    _..last = range
    guess(number, (current_guess + 1)..last)
  end

  defp print_guess(guess), do: IO.puts "Is it #{guess}"
end
