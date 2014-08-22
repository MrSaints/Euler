defmodule Problem_7 do
	#defp check_list(n) do
	#	limit = round(:math.sqrt(n))
	#	Stream.unfold 5,
	#		fn(n) when n >= limit ->
	#			nil
	#		(n) ->
	#			{n, n + 6}
	#		end
	#end

	defp naive(_, increment, limit) when increment > limit do
		true
	end

	defp naive(x, increment, _) when rem(x, increment) === 0 or rem(x, increment + 2) === 0 do
		false
	end

	# 6k ± 1 <= √n method (naive)
	defp naive(x, increment, limit) do
		naive(x, increment + 6, limit)
	end

	defp is_prime(x) when x < 4 and x > 1 do
		true
	end

	defp is_prime(x) when rem(x, 2) === 0 or rem(x, 3) === 0 do
		false
	end

	defp is_prime(x) do
		limit = round(:math.sqrt(x))
		naive(x, 5, limit)
	end

	defp nth_prime(n, position, found) when n === found do
		position - 1
	end

	defp nth_prime(n, position, found) do
		if is_prime(position) do
			nth_prime(n, position + 1, found + 1)
		else
			nth_prime(n, position + 1, found)
		end
	end

	defp nth_prime(n) do
		nth_prime(n, 5, 2)
	end

	def answer do
		nth_prime(10_001)
	end
end