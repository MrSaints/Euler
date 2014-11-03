defmodule Problem_48 do
    # Exponentiation by squaring
    def pow(x, n) when n < 0 do
        pow 1/x, -n
    end

    def pow(_, n) when n === 0 do
        1
    end

    def pow(x, n) when n === 1 do
        x
    end

    # O(log2n)
    def pow(x, n) when rem(n, 2) === 0 do
        pow x*x, round(n/2)
    end

    def pow(x, n) do
        x * pow x*x, round((n-1)/2)
    end

    def answer do
        Enum.reduce(1..1_000, &(
            pow(&1, &1) + &2
        )) |> Integer.to_string|> String.slice(-10, 10) |> String.to_integer
    end
end