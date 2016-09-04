fizz_buzz_result = fn
  (0, 0, _) -> IO.puts "FizzBuzz"
  (0, _, _) -> IO.puts "Fizz"
  (_, 0, _) -> IO.puts "Buzz"
  (_, _, n) -> IO.puts n
end

fizz_buzz = fn
  (n) -> fizz_buzz_result.(rem(n,3), rem(n,5), n)
end

fizz_buzz.(3)
fizz_buzz.(5)
fizz_buzz.(15)
fizz_buzz.(100)
