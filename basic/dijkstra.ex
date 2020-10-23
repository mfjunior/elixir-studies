defmodule Dijkstra do
  @moduledoc """
  Recursive exercises.
  """

  @doc """
  Calculates the greatest common divisor (gcd) of two integers.
  """
  def gcd(m, n) do
    cond do
      m == n -> m
      m > n -> gcd(m - n, n)
      true -> gcd(m, n - m)
    end
  end

end