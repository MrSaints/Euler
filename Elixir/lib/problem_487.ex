defmodule Problem_487 do
    require Logger
    use Bitwise

    # Faulhaber's formula
    def f_pyramid(n) do
        (2 * (Problem_25.pow(n, 3)) + (3 * (n * n)) + n) / 6
    end

    def f_quad(n) do
        ((6 * Problem_25.pow(n, 5)) + (15 * Problem_25.pow(n, 4)) + 
            (10 * Problem_25.pow(n, 3)) - n) / 30
    end

    defp sf(_, limit, position, _, accumulator) when position > limit do
        accumulator
    end

    defp sf(k, limit, position, prev_f_sum, accumulator) do
        Logger.info(Integer.to_string(position))
        new_f_sum = prev_f_sum + Problem_48.pow(position, k)
        sf(k, limit, position + 1, new_f_sum, accumulator + new_f_sum)
    end

    def s(k, n) do
        sf(k, n, 2, 1, 1)

        #Enum.reduce 1..n, &(
        #    f(k, &1) + &2
        #)
    end

    def f(k, n) do
        Enum.reduce 1..n, &(
            Problem_48.pow(&1, k) + &2
        )
    end

    def modExp(_, y, _, i, c) when i >= y do
        c
    end

    def modExp(x, y, p, i, c) do
        modExp x, y, p, i + 1, rem(c * x, p)
    end

    def modExp(x, y, p) do
        modExp x, y, p, 1, rem(1 * x, p) 
    end

    def rtlModExp(_, y, _, result) when y <= 0 do
        result
    end

    def rtlModExp(x, y, p, result) when band(y, 1) === 1 do
        rtlModExp(rem(x * x, p), y >>> 1, p, rem(result * x, p))
    end

    def rtlModExp(x, y, p, result) do
        rtlModExp(rem(x * x, p), y >>> 1, p, result)
    end

    def rtlModExp(x, y, p) do
        rtlModExp(x, y, p, 1)
    end

    def sumModf(k, n, p) do
        Enum.reduce(1..n, 
            fn (i, acc) ->
                #Logger.info(Integer.to_string(i))
                rtlModExp(i, k, p) + acc
            end
        ) |> rem(p)
    end

    def sumMods(k, n, p) do
        Enum.reduce(1..n, &(
            sumModf(k, &1, p) + &2
        )) |> rem(p)
    end

    defp betterSumMods(_, limit, _, position, _, accumulator) when position > limit do
        accumulator
    end

    defp betterSumMods(k, limit, p, position, prev_f_sum, accumulator) do
        new_f_sum = prev_f_sum + rtlModExp(position, k, p)
        betterSumMods(k, limit, p, position + 1, new_f_sum, rem(accumulator + new_f_sum, p))
    end

    def betterSumMods(k, n, p) do
        betterSumMods(k, n, p, 2, 1, 1)
    end

    def generateFmodseq(_, n, _, i, seq) when i > n do
        seq
    end

    def generateFmodseq(k, n, p, i, seq) do
        generateFmodseq(k, n, p, i + 1, seq ++ [rtlModExp(i, k, p)])
    end

    def generateFmodseq(k, n, p) do
        generateFmodseq(k, n, p, 2, [1])
    end

    def _sumFmodseq(_, accumulator, remaining) when remaining === 0 do
        accumulator
    end

    def _sumFmodseq(seq, accumulator, remaining) do
        [head | tail] = seq
        _sumFmodseq(tail, accumulator + (head * remaining), remaining - 1)
    end

    def sumFmodseq(k, n, p) do
        [head | tail] = generateFmodseq(k, n, p)
        _sumFmodseq(tail, head * n, n - 1) |> rem(p)
    end

    def answer do
        Enum.reduce(2_000_000_000..2_000_002_000, &(
            if Problem_7.is_prime(&1) do
                Logger.info Integer.to_string &1
                sumMods(10_000, 1_000_000_000_000, &1) + &2
            else
                &2
            end
        ))
    end
end