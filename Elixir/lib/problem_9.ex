defmodule Problem_9 do
    require Logger

    # m < n
    def pythagorean_triple(m, n) do
        {(n*n) - (m*m), 2*n*m, (n*n) + (m*m)}
    end

    defp find_triple_sum(x, m, n, limit) when n === limit do
        find_triple_sum x, m + 1, m + 2, limit
    end

    defp find_triple_sum(x, m, n, limit) do
        tuple = pythagorean_triple m, n
        if elem(tuple, 0) + elem(tuple, 1) + elem(tuple, 2) === x do
            Logger.info "M: " <> Integer.to_string(m) <> ", N: " <> Integer.to_string(n)
            tuple
        else
            find_triple_sum x, m, n + 1, limit
        end
    end

    def find_triple_sum(x) do
        find_triple_sum x, 1, 2, round(:math.sqrt(x))
    end

    def answer do
        tuple = find_triple_sum(1000)
        elem(tuple, 0) * elem(tuple, 1) * elem(tuple, 2)
    end
end