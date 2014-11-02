# O(N ^ N)
defmodule Problem_25 do
	def pow(_, y, acc, i) when i === y do
		acc
	end

	def pow(x, y, acc, i) do
		pow x, y, acc * x, i + 1
	end

	def pow(x, y) do
		pow x, y, x, 1
	end

	def answer do
		Enum.reduce(1..1_000, &(
			pow(&1, &1) + &2
		)) |> Integer.to_string|> String.slice(-10, 10) |> String.to_integer
	end
end