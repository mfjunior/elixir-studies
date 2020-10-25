defmodule Powers do
  @moduledoc """
  Recursive exercises.
  """
  
  import Kernel, except: [raise: 2]

  def raise(x, n) do
    cond do
      n == 0 -> 1
      n == 1 -> x
      n > 0 -> x * raise(x, n-1)
      n < 0 -> 1.0 / raise(x, -n)
    end
  end

  # using guard clauses
  """
  def raise(_, 0) do
    1
  end

  def raise(x, 1) do
    x
  end

  def raise(x, n) when n > 0 do
    x * raise(x, n - 1)
  end

  def raise(x, n) when n < 0 do
    1.0 / raise(x, -n)
  end
  """

end