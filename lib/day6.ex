defmodule Advent2022.Day6 do
  def real_data do
    File.read!("priv/day6.txt") # Just a one-line string, no parsing lines today
  end

  defmodule A do

    def solve(data) do
      char_list = data |> String.split("", trim: true)

      {_rest, counter} =
      Enum.reduce_while(
        char_list,
        {char_list, 3},
        fn _char, {list_rest, counter} ->
          list_rest
          |> Enum.take(4)
          |> Enum.frequencies()
          |> Map.keys()
          |> length()
          |> fn 4 -> {:halt, {list_rest |> tl(), counter+1}}
                _ -> {:cont, {list_rest |> tl(), counter+1}}
             end
             .()
        end
      )

      counter
    end

  end

  defmodule B do

    def solve(data) do
      char_list = data |> String.split("", trim: true)

      {_rest, counter} =
      Enum.reduce_while(
        char_list,
        {char_list, 13},
        fn _char, {list_rest, counter} ->
          list_rest
          |> Enum.take(14)
          |> Enum.frequencies()
          |> Map.keys()
          |> length()
          |> fn 14 -> {:halt, {list_rest |> tl(), counter+1}}
                _ -> {:cont, {list_rest |> tl(), counter+1}}
             end
             .()
        end
      )
      
      counter
    end

  end
end
