# Exercise: ModulesAndFunctions-4

defmodule TokenSender do
  def process(send_to) do
    receive do
      token ->
        send send_to, token
    end
  end

  def create_processes(send_to) do
    fred = spawn(TokenSender, :process, [send_to])
    betty = spawn(TokenSender, :process, [send_to])
    send fred, {:ok, :fred}
    await_return
    send betty,{:ok, :betty}
    await_return
  end

  def run do
    create_processes(self)
  end

  def await_return do
    receive do
      {:ok, token} ->
        IO.puts inspect(token)
    end
  end
end
