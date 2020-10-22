defmodule Basic do
  
  # gets user input and removes the newline
  def get_input do
    IO.gets("What is your name?")
    |> String.trim()
    |> IO.puts()
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

  def math_and_comparison do
    IO.puts "5 + 4 = #{5 + 4}"
    IO.puts "5 - 4 = #{5 - 4}"
    IO.puts "5 * 4 = #{5 * 4}"
    IO.puts "5 / 4 = #{5 / 4}"
    IO.puts "5 div 4 = #{div(5, 4)}"
    IO.puts "5 rem 4 = #{rem(5, 4)}"

    IO.puts "4 == 4.0 : #{4 == 4.0}"
    IO.puts "4 === 4.0 : #{4 === 4.0}"
    IO.puts "4 != 4.0 : #{4 != 4.0}"
    IO.puts "4 !== 4.0 : #{4 !== 4.0}"

    IO.puts "5 > 4 : #{5 > 4}"
    IO.puts "5 >= 4 : #{5 >= 4}"
    IO.puts "5 < 4 : #{5 < 4}"
    IO.puts "5 <= 4 : #{5 <= 4}"
  end

  def logical_operators do
    age = 16
    color = :red
    IO.puts "Vote and drink: #{age >= 16 and color != :red}"
    IO.puts "Vote && drink: #{age >= 16 && color != :red}"
    IO.puts "Vote or drive: #{age >= 16 or age >= 18}"
    IO.puts "Vote || drive: #{age >= 16 || age >= 18}"

    IO.puts not true 
    IO.puts !false   
  end

  def decision_making do
    age = 16
    if age >= 18 do
      IO.puts "You can drive"
    else
      IO.puts "You can wait"
    end

    unless age === 18 do    ## !
      IO.puts "You are not 18"
    else
      IO.puts "You are 18"
    end

    cond do
      age >= 14 -> IO.puts "You can wait"
      age >= 16 -> IO.puts "You can drive"
      age >= 18 -> IO.puts "You can vote"
      true -> IO.puts "Default"
    end

    case 2 do
      1 -> IO.puts "Entered 1"
      2 -> IO.puts "Entered 2"
      _ -> IO.puts "Default"
    end

    IO.puts "Ternary: #{if age > 18, do: "Can Vote", else: "Can't Vote"}"

  end

  def tuples do
    # create a tuple
    my_stats = {190, 1.82, :Mauro}
    IO.puts "Tuple #{is_tuple(my_stats)}"

    # append value
    my_stats2  = Tuple.append(my_stats, 40)
    IO.inspect my_stats2
    
    # retrieve value by index
    IO.puts "Age #{elem(my_stats2, 3)}"

    # get tuple size
    IO.puts "Size #{tuple_size(my_stats2)}"

    # delete an index
    my_stats3 = Tuple.delete_at(my_stats2, 0)
    IO.inspect my_stats3
    
    # insert at an index
    my_stats4 = Tuple.insert_at(my_stats3, 0, 1980)
    IO.inspect my_stats4

    # create a tuple with same values, n times
    my_tuple_duplicated = Tuple.duplicate(0, 5)
    IO.inspect my_tuple_duplicated

    # tuples for pattern matching
    {weight, height, name} = {190, 1.82, :Mauro}
    IO.puts "Weight: #{weight}"
  end

  def lists do
    list1 = [1, 2, 3]
    list2 = [4, 5, 6]

    list3 = list1 ++ list2
    IO.inspect list3
    list4 = list3 -- list1
    IO.inspect list4

    # verify if an item is in a list
    IO.puts 6 in list4

    [head | tail] = list3
    IO.puts head
    IO.inspect tail

    IO.inspect [97,98], charlists: :as_lists
    IO.puts [97,98]

    # you can enumerate over a list
    Enum.each list3, fn item -> IO.puts item end
     
    words = ["Random", "words", "in a", "list"]
    Enum.each words, fn word -> IO.puts word end

    words_deleted1 = List.delete(words, "Random")
    IO.inspect words_deleted1

    words_deleted2 = List.delete_at(words, 1)
    IO.inspect words_deleted2
    
    word_inserted = List.insert_at(words, 3, "Ola")
    IO.inspect word_inserted

    IO.puts List.first(words)
    IO.puts List.last(words)
    
    key_value_list = [name: "Mauro", altura: 1.90, peso: 120]
    IO.inspect key_value_list
  end

  def maps do
    capitais = %{"Rio Grande do Sul" => "Porto Alegre", 
      "Santa Catarina" => "Florianópolis", "São Paulo" => "São Paulo",
      "Espírito Santo" => "Vitória"}
    IO.puts capitais["Espírito Santo"]

    capitais_atoms = %{acre: "Rio Branco", amazonas: "Manaus", roraima: "Boa Vista"}
    IO.puts capitais_atoms.amazonas

    capitais_nova = Map.put_new(capitais, "Sergipe", "Aracaju")
    IO.inspect capitais_nova
  end

  def pattern_matching do
    [length, width] = [20, 50]
    IO.puts length
    IO.puts width

    [_, [_, a]] = [20, [30, 40]]
    IO.puts a

    {:ok, value} = {:ok, "Successful!"}
    value
  end
end