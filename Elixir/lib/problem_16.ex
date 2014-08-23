defmodule Problem_16 do
    defp power_digit_sum(i, pow) do
        # TODO: Convert string to int in the reduction function.
        # (Saves an unnecessary loop)
        # Process: power -> convert float to int -> convert to string -> explode -> map to int -> sum
        :math.pow(i, pow) |> round |> Integer.to_string |> String.codepoints |> Enum.map(&String.to_integer/1) |> Enum.sum
    end

    def answer do
        power_digit_sum 2, 1000
    end
end