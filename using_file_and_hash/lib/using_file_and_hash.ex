defmodule UsingFileAndHash do
  @moduledoc """
  Your local college has given you a text file that contains data about which courses are taught in which rooms. 
  Here is part of the file. The first column is the course ID number. The second column is the course name, 
  and the third column is the room number.

  64850,ENGL 033,RF141
  64851,ENGL 080,SC103
  64853,ENGL 102,C101B
  
  Your job in this étude is to read the file and create a Map whose key is the room number and whose value is a list of all the courses taught in that room.

  Opening Files
  To open file test.csv, which you will find in the example download area at URL goes here, use File.open/2, which takes the path to a file as its first argument 
  and a list of options as its second argument. Here is a shell session that opens the file, reads one line, and then closes the file.

  iex(1)> {result, device} = File.open("courses.csv", [:read, :utf8])
  {:ok,#PID<0.39.0>}
  iex(2)> data = IO.readline(device)
  "64850,ENGL 033,RF141\n"
  iex(3)> File.close(device)
  :ok
  If you successfully open the file, result will be :ok, and the device will be the variable you when reading or closing the file. 
  If there is some error, result will be :error, and the device variable will contain the reason that the file open failed.

  IO.readline/1 reads a line from the file (including the ending \n character) unless there is no more data, in which case you will get the atom :eof.

  Note
  If you do not use the :utf8 option, the file will open in binary mode, and you will only be able to use the most basic input and output operations on the file.

  Here is a portion of the output, edited to save space.

  iex(1)> c("college.ex")
  [College]
  iex(2)> College.make_room_list("courses.csv")
  #HashDict<[{"RF241",["CIT 050","CIT 042","CIT 020","PSYCH 018"]},
  {"RE311",["PSYCH 092","HIST 010A"]},
  {"AD211",["MATH 061","CHEM 030B","CHEM 030A","CHEM 001B",
  "CHEM 001A"]},
  {"RF234",["COMSC 076","CIT 010","BIS 107","ACCTG 030"]},
  {"RE301",["BUS 009","LA 050","ESL 346"]},
  {"C104",["MATH 311"]},...}
  """

  @doc """
  Open a file with columns course ID, name, and room.
  Construct a Map with the room as a key and the courses
  taught in that room as the value.
  """
  @spec make_room_list(String.t) :: Map.t
  
  def make_room_list(file_name) do
    {_result, device} = File.open(file_name, [:read, :utf8])
    room_list = Map.new()
    process_line(device, room_list)
  end

  # Read next line from file; if not end of file, process
  # the room on that line. Recursively read through end of file.
  defp process_line(device, room_list) do
    data = IO.read(device, :line)
    case data do
      :eof ->
        File.close(device)
        room_list
      _ ->
        updated_list = process_room(data, room_list)
        process_line(device, updated_list)
    end
  end

  # Extract information from a line in the file, and append
  # course to hash dictionary value for the given room.
  defp process_room(data, room_list) do
    [_id, course, room] = String.split(String.trim(data), ",")
    course_list = Map.get(room_list, room)
    updated_list = case course_list do
      nil -> Map.put_new(room_list, room, [course])
      _ -> Map.put(room_list, room, [course | course_list])
    end
    updated_list
  end
end
