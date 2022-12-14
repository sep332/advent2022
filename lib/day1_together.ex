defmodule Advent2022.Day1Together do
  
  def read_lines do
    {:ok, file} = File.open("priv/day1.txt",[:read])

    IO.read(file,:line)
    |> thing(file,0,0)
  end

  def thing(:eof,_file,current_sum,highest_sum) do
    max(current_sum,highest_sum)
  end
  def thing("\n",file,current_sum,highest_sum) do
    IO.read(file,:line)
    |> thing(file,0,max(current_sum,highest_sum))
  end 
  def thing(line,file,current_sum,highest_sum) do
    {value,_}=Integer.parse(line)
    IO.read(file,:line)
    |> thing(file,current_sum+value,highest_sum)
  end
  
end
