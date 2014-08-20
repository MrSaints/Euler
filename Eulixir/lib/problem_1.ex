defmodule Problem_1 do
	def answer do
		Enum.reduce 1..999, 0, &(
			if rem(&1, 3) === 0 || rem(&1, 5) === 0 do
				&1 + &2
			else
				&2
			end
		)
	end
end