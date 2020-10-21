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
end