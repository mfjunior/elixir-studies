defmodule Hello do
  def print(lang \\ :pt)

  def print(:de), do: "Hallo Welt"
  def print(:en), do: "Hello World"
  def print(:es), do: "Hola Mundo"
  def print(:pt), do: "Olá Mundo"
  def print(:ru), do: "Привет мир"

end