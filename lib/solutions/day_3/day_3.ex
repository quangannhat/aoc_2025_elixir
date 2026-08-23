defmodule Solutions.Day3 do
  def solve do
    with {:ok, text} <- File.read(Solutions.input_path(3)) do
      text
      |> parse_input()
      |> calc_answer()
    end
  end

  defp parse_input(text) do
    text
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  defp calc_answer(line) do
    line
    |> Enum.map(&calc_line/1)
    |> Enum.sum()
  end

  defp calc_line([first | rest]) do
    Enum.reduce(rest, {0, first}, fn digit, {biggest_number, biggest_digit} ->
      candidate = biggest_digit * 10 + digit
      new_max = max(candidate, biggest_number)
      new_biggest_digit = max(biggest_digit, digit)
      {new_max, new_biggest_digit}
    end)
    |> elem(0)
  end
end
