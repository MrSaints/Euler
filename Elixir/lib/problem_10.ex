defmodule Problem_10 do
    def answer do
        Enum.reduce 1..2_000_000, 0, &(
            if Problem_7.is_prime(&1) do
                &1 + &2
            else
                &2
            end
        )
    end
end