defmodule Problem_3 do
    defp factor(x, n, acc) when x === n do
        acc ++ [x]
    end

    defp factor(x, n, acc) when rem(n, x) === 0 do
        factor 2, div(n, x), acc ++ [x]
    end

    defp factor(x, n, acc) do
        factor x + 1, n, acc
    end

    defp factor(n) do
        factor 2, n, []
    end

    def answer do
        hd Enum.reverse factor(600_851_475_143)
    end
end