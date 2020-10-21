defmodule Basic do
  
  # gets user input and removes the newline
  def get_input do
    IO.gets("What is your name?")
    |> String.trim
    |> IO.puts   
  end
end