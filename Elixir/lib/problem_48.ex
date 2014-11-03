defmodule Problem_48 do
    use Bitwise

    def pow(_, 0) do
        1
    end

    def pow(a, 1) do
        a
    end

    def pow(a, n) when band(n, 1) === 0 do
        tmp = pow(a, n >>> 1) # /2
        tmp * tmp
    end

    def pow(a, n) do
        a * pow(a, n - 1)
    end

    def answer do
        Enum.reduce(1..1_000, &(
            pow(&1, &1) + &2
        )) |> Integer.to_string|> String.slice(-10, 10) |> String.to_integer
    end
end