defmodule Problem_487 do
    # Faulhaber's formula
    defp f_pyramid(n) do
        (2 * (Problem_25.pow(n, 3)) + (3 * (n * n)) + n) / 6
    end

    defp f_quad(n) do
        ((6 * Problem_25.pow(n, 5)) + (15 * Problem_25.pow(n, 4)) + 
            (10 * Problem_25.pow(n, 3)) - n) / 30
    end

    def power_sums(k, n) when k === 2 do
        f_pyramid(n)
    end

    def power_sums(k, n) when k === 4 do
        f_quad(n)
    end

    def power_sums(k, n) do
        Enum.reduce 1..n, &(
            Problem_25.pow(&1, k) + &2
        )
    end

    def sum_power_sums(k, n) do
        Enum.reduce 1..n, &(
            power_sums(k, &1) + &2
        )
    end

    def answer do
        
    end
end