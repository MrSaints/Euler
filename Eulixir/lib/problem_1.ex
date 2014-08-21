defmodule Problem_1 do
    defp euler_filter(x, acc) when rem(x, 3) === 0 or rem(x, 5) === 0 do
        x + acc
    end

    defp euler_filter(_, acc) do
        acc
    end

    def answer do
        Enum.reduce 1..999, 0, &euler_filter/2
    end
end