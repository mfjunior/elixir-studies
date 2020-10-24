defmodule AskArea do

  def area() do
    input = IO.gets("(R)ectangle, (T)riangle, (E)llipse: ")
    shape = char_to_shape(String.first(input))
    {d1, d2} = case shape do
        :rectangle -> get_dimensions("width", "height")
        :triangle -> get_dimensions("base", "height")
        :ellipse -> get_dimensions("major radius", "minor radius")
        :unknown -> {0, 0}
    end
    calculate(shape, d1, d2)
  end

  def char_to_shape(character) do
    cond do
      String.upcase(character) == "R" -> :rectangle
      String.upcase(character) == "T" -> :triangle
      String.upcase(character) == "E" -> :ellipse
      true -> :unknown
    end
  end

  def get_number(prompt) do
    input = IO.gets("Enter #{prompt} > ")
    String.to_integer(String.trim(input))
  end

  def get_dimensions(prompt1, prompt2) do
    n1 = get_number(prompt1)
    n2 = get_number(prompt2)
    {n1, n2}  
  end

  def calculate(shape, d1, d2) do
    cond do
      shape == :unknown -> IO.puts("Unknown shape #{d1}")
      d1 < 0 or d2 < 0 ->
        IO.puts("Both numbers must be grater than or equal to zero.")
      true -> Geometry.area({shape, d1, d2})
    end
  end
end