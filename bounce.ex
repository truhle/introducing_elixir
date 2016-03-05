defmodule Bounce do
  # def report(count) do
  #   new_count = receive do
  #     msg -> IO.puts("Received #{count}: #{msg}")
  #     count + 1
  #   end
  #   report(new_count)
  # end

  def report do
    receive do
      x -> IO.puts("Divided to #{x / 2}")
      report()
    end
  end
end
