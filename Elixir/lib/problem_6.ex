defmodule Problem_6 do
    defp sum_of_squares(range) do
        Enum.reduce range, &(
            (&1 * &1) + &2
        )
    end

    defp square_of_sum(range) do
        sum = Enum.reduce range, &+/2
        sum * sum
    end

    def answer do
        range = 1..100
        square_of_sum(range) - sum_of_squares(range)
    end
end