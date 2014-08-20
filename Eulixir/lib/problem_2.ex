defmodule Problem_2 do
    defp fib(limit) do
        Stream.unfold {0, 1},
            fn {a, b} ->
                if a > limit do
                    nil
                else
                    {a, {b, a + b}}
                end
            end
    end

    def answer do
        Enum.reduce fib(4_000_000), &(
            if rem(&1, 2) === 0 do
                &1 + &2
            else
                &2
            end
        )
    end
end