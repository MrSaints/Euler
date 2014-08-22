defmodule Problem_5 do
    # Euclid's algorithm
    defp gcd(a, b) when b == 0 do
        a
    end

    defp gcd(a, b) do
        gcd b, rem(a, b)
    end

    # Reduction by GCD
    defp lcm(a, b) do
        round (a / gcd(a, b)) * b
    end

    def answer do
        # Anything even is divisible by 2.
        # A number does not change when divided by 1.
        # 1 and 2 can be ignored.
        Enum.reduce 10..20, &lcm/2
    end
end