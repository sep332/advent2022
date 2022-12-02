defmodule Advent2022.Util do

  @doc "Split a file into lines, and return a list of strings."
  def parse_strings(data) do
    data
    |> String.split("\n")
  end

  @doc "Split a file into lines, and parse each line into an integer (or nil for blank lines)."
  def parse_ints(data) do
    data
    |> String.split("\n")
    |> Enum.map(&integer_or_nil/1)
  end

  @doc "String.to_integer() doesn't like empty strings. Return nil instead of trying to parse them."
  def integer_or_nil("") do
    nil
  end
  def integer_or_nil(string) do
    string
    |> String.to_integer()
  end

end