defmodule Problem_4 do
    defp is_palindrome(x) do
        str_x = Integer.to_string(x)
        String.reverse(str_x) === str_x
    end

    defp brute(x, y, _, max) when x === 100 and y === 100 do
        max
    end

    defp brute(x, y, y_for_x, max) when y === 100 do
        new_x = x - 1
        brute(new_x, y_for_x, new_x, max)
    end

    defp brute(x, y, y_for_x, max) do
        prod_xy = x * y
        if is_palindrome(prod_xy) and prod_xy > max do
            brute(x, y - 1, y_for_x, prod_xy)
        else
            brute(x, y - 1, y_for_x, max)
        end
    end

    def answer do
        brute(999, 999, 999, 1)
    end
end