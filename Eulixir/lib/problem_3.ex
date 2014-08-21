defmodule Problem_3 do
    def factor(x, n, acc) when x === n do
        [x | acc]
    end

    def factor(x, n, acc) when rem(n, x) === 0 do
        factor(2, div(n, x), [x | acc])
    end

    def factor(x, n, acc) do
        factor(x + 1, n, acc)
    end

    def factor(n) do
        factor(2, n, [])
    end

    def answer do
        [largest | _ ] = factor(600_851_475_143)
        largest
    end
end