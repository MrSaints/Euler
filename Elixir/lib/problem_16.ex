defmodule Problem_16 do
    # TODO: Convert string to int in the reduction function.
    # (Saves an unnecessary loop)
    # Process: convert to string -> explode -> map to int -> sum
    def digit_sum(digit) do
        Integer.to_string(digit) |> String.codepoints |> Enum.map(&String.to_integer/1) |> Enum.sum
    end

    def answer do
        # Process: power via erlang -> convert float to int -> sum of digits
        :math.pow(2, 1000) |> round |> digit_sum
    end
end