defmodule NewtonRaphson do
  import Kernel, except: [raise: 2]

  def nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end

  defp nth_root(x, n, estimate) do
    IO.puts("Current guess is #{estimate}")
    f = raise(estimate, n) - x
    f_prime = n * raise(estimate, n - 1)
    next = estimate - f / f_prime
    change = abs(estimate - next)
    cond do
      change < 1.0e-10 -> next
      true -> nth_root(x, n, next)
    end
  end

  def raise(x, n) do
    cond do
      n == 0 -> 1
      n == 1 -> x
      n > 0 -> x * raise(x, n-1)
      n < 0 -> 1.0 / raise(x, -n)
    end
  end

  
end