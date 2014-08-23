# Sum of digits (similar to 13 and 16)
# Consider: optimised common utility for addition
defmodule Problem_20 do
    defp factorial(n) do
        Enum.reduce n..1, &*/2
    end

    def answer do
        factorial(100) |> Problem_16.digit_sum
    end 
end