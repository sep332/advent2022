defmodule Advent2022.Day8 do
  def real_data do
    File.read!("priv/day8.txt")
    |> Advent2022.Util.parse_strings()
  end

  @doc "It's just easier to work with lists of lists in certain orientations"
  def four_rotated_copies(map) do
    [
      map,
      map |> rotate_map(1),
      map |> rotate_map(2),
      map |> rotate_map(3),
    ]
  end

  def rotate_map(map, 0), do: map
  def rotate_map(map, times) do
    map
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.reverse/1)
    |> rotate_map(times - 1)
  end

  @doc "For each element, set lower-or-equal elements to the right to 0"
  def blank_rightward(map) do
    map
    |> Enum.map(&blank_line_rightward/1)
  end

  def blank_line_rightward(line, position \\ 1) do
    line
    |> Enum.split(position)
    |> fn {all, []} -> all
          {left, right} -> left ++ blank_leq(right, hd(Enum.reverse(left))) |> blank_line_rightward(position + 1) end .()
  end

  def blank_leq(list, value) do
    list
    |> Enum.map(
      fn item ->
        case item > value do
          true -> item
          false -> -1
        end
      end
    )
  end

  def unrotate_four([map0, map1, map2, map3]) do
    [
      map0,
      map1 |> rotate_map(3),
      map2 |> rotate_map(2),
      map3 |> rotate_map(1)
    ]
  end

  def add_nonzeros(maps) do
    maps
    |> Enum.zip_with(fn line0, line1, line2, line3 -> Enum.zip([line0, line1, line2, line3]) |> Enum.map(fn four_values -> four_values |> Enum.find(& &1) end) end)
  end

  defmodule A do

    def solve(data) do
      data
      |> Enum.map(fn line -> line |> String.split("", trim: :true) |> Enum.map(&String.to_integer(&1)) end)
      |> Advent2022.Day8.four_rotated_copies # east, south, west, north
      |> Enum.map(&Advent2022.Day8.blank_rightward/1)
      |> Advent2022.Day8.unrotate_four()
      |> Enum.zip() # 4 x N x N -> N x 4 x N
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.map(fn layer -> layer |> Enum.zip() |> Enum.map(&Tuple.to_list/1) end) # N x 4 x N -> N x N x 4
      |> Enum.map(
        fn layer ->
          layer
          |> Enum.count(
            fn [-1, -1, -1, -1] -> false
               _ -> true
            end
          )
        end
      )
      |> Enum.sum()
    end

  end

  defmodule B do

    def solve(data) do
      
    end

  end
end
