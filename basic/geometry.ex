defmodule Geometry do
  @moduledoc """
  Areas of geometric shapes.
  """

  @doc """
  Calculates the area of a rectangle, default values are 1
  """
  def rectangle_area(length, width) do
    length * width
  end

  @doc """
  """
  def area_default_values(length \\ 1, width \\ 1) do
    length * width
  end

@doc """
Calculate the area of a square shape
"""
  def square_area(length \\ 1) do
    length * length
  end

  #def area(:rectangle, length, width), do: length * width
  #def area(:triangle, base, height), do: base * height / 2.0
  #def area(:ellipse, a, b), do: :math.pi * a * b
  
  def area({shape, dim1, dim2}) do
    area(shape, dim1, dim2)
  end
  
  defp area(:rectangle, length, width) when length >= 0 and width >= 0 do
    length * width
  end

  defp area(:triangle, base, height) when base >= 0 and height >= 0 do
    base * height / 2.0
  end

  defp area(:ellipse, a, b) when a >= 0 and b >= 0 do
    :math.pi * a * b
  end

  defp area(_, _, _) do
    0
  end

  def area_case(shape, a, b) when a >= 0 and b >= 0 do
    case shape do
      :rectangle -> a * b
      :triangle -> a * b / 2.0
      :ellipse -> :math.pi * a * b
      default -> 0
    end
  end
  
end