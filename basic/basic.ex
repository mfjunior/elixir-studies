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
    :"São José"

    # Range defines a start and end using ints
    range_1 = 1..10
    |> Enum.each(fn x -> IO.inspect x end)

  end

  def strings do
    # Strings are defined with double quotes
    my_string = "My string"
    IO.puts "String length: #{String.length(my_string)}"

    # Concatenate strings
    string_concatenated = my_string <> " concatenated"
    IO.puts string_concatenated

    # String comparison
    IO.puts "Equal? (Dog == Dog): #{"Dog" === "Dog"}"

    # Check if a string contains another string
    IO.puts String.contains?(my_string, "string")

    # Return first character
    IO.puts String.first(my_string)

    # Get character at index
    IO.puts String.at(my_string, 5)

    # Get a substring
    IO.puts "Substring: #{String.slice(my_string, 3, 5)}"

    # Split a string into a list
    IO.inspect String.split(string_concatenated, " ")

    # Reverse a string
    IO.puts String.reverse(string_concatenated)

    # Uppercase
    IO.puts String.upcase(string_concatenated)

    # Lowercase
    IO.puts String.downcase(string_concatenated)

    # Capitalize
    IO.puts String.capitalize(string_concatenated)

    # Pipe output from one to another
    5 * 10 |> IO.puts

  end

end