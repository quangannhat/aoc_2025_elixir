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
    Enum.reduce(ranges, 0, fn range, total ->
      range_sum =
        range
        |> Enum.to_list()
        |> sum_of_invalid()

      total + range_sum
    end)
  end

  defp sum_of_invalid(parsed_range, sum \\ 0) do
    case parsed_range do
      [] ->
        sum

      [current | rest] ->
        new_sum = if invalid_id?(current), do: sum + current, else: sum
        sum_of_invalid(rest, new_sum)
    end
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
