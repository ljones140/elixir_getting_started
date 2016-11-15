defmodule Countdown do

  def sleep(seconds) do
    receive do
      after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn -> # the number of seconds to the start of the next minute
        {_h, _m, s} = :erlang.time
        60 - s - 1
      end,

      fn   # wait for the next second then return it's countdown
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ ->  end #nothing to deallocate
    )
  end
end

'''
iex(4)> counter = Countdown.timer
#Function<49.77324385/2 in Stream.resource/3>

iex(5)> printer = counter |> Stream.each(&IO.puts/1)
#Stream<[enum: #Function<49.77324385/2 in Stream.resource/3>,
 funs: [#Function<38.77324385/1 in Stream.each/2>]]>

iex(6)> speaker = printer |> Stream.each(&Countdown.say/1)
#Stream<[enum: #Function<49.77324385/2 in Stream.resource/3>,
 funs: [#Function<38.77324385/1 in Stream.each/2>,
  #Function<38.77324385/1 in Stream.each/2>]]>

iex(7)> speaker |> Enum.take(5)
# now let the talking happen !!!
'''
