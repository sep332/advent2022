defmodule Advent2022.Day25 do
    def real_data do
      File.read!("priv/day25.txt")
      |> Advent2022.Util.parse_strings()
    end

  
    defmodule A do
  
      def solve(data) do
        data
        |> Enum.map(&String.split(&1, "", trim: :true))
        |> Enum.map(
            fn digit_list -> all_plus_two(digit_list) - (String.duplicate("2", length(digit_list)) |> convert_from_base_five() ) end
        )
        |> Enum.sum()
        |> convert_to_snafu()
      end

      def all_plus_two(running \\ 0, digits)
      def all_plus_two(running, [head | tail]) do
        all_plus_two((running * 5) + to_decimal_plus_two(head), tail)
      end

      def all_plus_two(sum, []) do
        sum
      end

      def convert_from_base_five(running \\ 0, digits)
      def convert_from_base_five(running, stringy_int) when is_binary(stringy_int) do
        convert_from_base_five(running, String.split(stringy_int, "", trim: :true))
      end
      def convert_from_base_five(running, [head | tail]) do
        convert_from_base_five(running * 5 + String.to_integer(head), tail)
      end
      def convert_from_base_five(sum, []) do
        sum
      end

      def to_decimal_plus_two("="), do: 0
      def to_decimal_plus_two("-"), do: 1
      def to_decimal_plus_two("0"), do: 2
      def to_decimal_plus_two("1"), do: 3
      def to_decimal_plus_two("2"), do: 4

      def convert_to_snafu(decimal_int) do
        (decimal_int + (convert_from_base_five((String.duplicate("2", 6))))) # Change this according to the number of base-5 digits in the answer
        |> convert_to_base_five([])
        |> Enum.map(&to_snafu(&1))
        |> Enum.join("")
      end

      def to_snafu(0), do: "="
      def to_snafu(1), do: "-"
      def to_snafu(2), do: "0"
      def to_snafu(3), do: "1"
      def to_snafu(4), do: "2"

      def convert_to_base_five(decimal, exponent \\ 20, digits)

      def convert_to_base_five(decimal, exponent, [0]) do
        convert_to_base_five(decimal, exponent, [])
      end

      def convert_to_base_five(_decimal, -1, digits) do
        digits
      end

      def convert_to_base_five(decimal, exponent, digits) do
        quotient = div(trunc(decimal), trunc((:math.pow(5, exponent))))

        convert_to_base_five(decimal - (quotient * :math.pow(5, exponent)), exponent - 1, Enum.reverse([quotient | Enum.reverse(digits)]))
      end
  
    end
  
    defmodule B do

    
        def solve(data) do

        end
  
    end
  end
  