defmodule Basic do
  
  # gets user input and removes the newline
  def get_input do
    IO.gets("What is your name?")
    |> String.trim
    |> IO.puts   
  end

  # data are immutable
  # data types: integer, float, boolean, atom, Strings
  def data_types do
    # Integers in Erlang/Elixir are only limited by the 
    # memory available on the system, so there's virtually 
    # no limit on how large they can be
    integer_1 = 1007
    IO.puts "Integer: #{is_integer(integer_1)}"

    # Floats have about 64 bit double precision    
    float_1 = 2.77
    IO.puts "Float: #{is_float(float_1)}"

    # Atom name is its value
    IO.puts "Atom #{is_atom(:cidade)}"

    # Double quotes for atoms with space
    "São José"

    # Range defines a start and end using ints
    range_1 = 1..10
    |> Enum.each(fn x -> IO.inspect x end)

  end


end