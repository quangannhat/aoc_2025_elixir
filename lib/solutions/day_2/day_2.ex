defmodule Solutions.Day2 do
  def solve do
    with {:ok, text} <- File.read(Solutions.input_path(2)) do
      text
      |> parse_input()
      |> calc_answer()
    end
  end

  defp parse_input(text) do
    text
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(&parse_range/1)
  end

  defp parse_range(range) do
    [first, last] = String.split(range, "-", parts: 2)
    String.to_integer(first)..String.to_integer(last)
  end

  defp calc_answer(ranges) do
    ranges
    |> Enum.map(&sum_of_invalids/1)
    |> Enum.sum()
  end

  defp sum_of_invalids(range) do
    Enum.reduce(range, 0, fn id, sum ->
      if invalid_id?(id), do: sum + id, else: sum
    end)
  end

  defp invalid_id?(num) do
    Integer.to_string(num)
    |> split_in_half()
    |> same_half?()
  end

  defp split_in_half(str) do
    mid = str |> String.length() |> div(2)
    String.split_at(str, mid)
  end

  defp same_half?({half, half}), do: true
  defp same_half?(_), do: false
end
