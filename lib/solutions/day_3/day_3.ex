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
  end

  defp calc_answer(_input) do
    raise "Day 3 calculation not implemented"
  end
end
