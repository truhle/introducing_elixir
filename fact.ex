defmodule Fact do

  def factorial(n) when n > 1 do
    IO.puts("Calling from #{n}.")
    result = n * factorial(n-1)
    IO.puts("#{n} yields #{result}")
    result
  end

  def factorial(n) when n <= 1 do
    IO.puts("Calling from 1")
    IO.puts("1 yields 1")
    1
  end

  def factorial_up(n) do
    factorial_up(1,n,1)
  end

  defp factorial_up(current, n, result) when current <= n do
    IO.puts("Calling from #{current}")
    new_result = current * result
    IO.puts("#{current} yields #{new_result}")
    factorial_up(current + 1, n, new_result)
  end

  defp factorial_up(_current, _n, result) do
    IO.puts("finished!")
    result
  end
end
