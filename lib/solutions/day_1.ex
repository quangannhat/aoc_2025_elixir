defmodule Solutions.Day1 do
  def solve do
    with {:ok, text} <- File.read(Solutions.input_path()) do
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
    |> String.split_at(1)
    |> parse_parts()
  end

  defp parse_parts({"L", amount}) do
    {:left, String.to_integer(amount)}
  end

  defp parse_parts({"R", amount}) do
    {:right, String.to_integer(amount)}
  end

  @starting_point 50
  @dial_size 100

  defp calc_answer(input, acc \\ @starting_point, counter \\ 0) do
    case input do
      [] ->
        counter

      [rotation | remaining] ->
        {new_pos, new_counter} = rotate(acc, rotation, counter)
        calc_answer(remaining, new_pos, new_counter)
    end
  end

  defp rotate(position, {:left, amount}, counter) do
    new_pos = Integer.mod(position - amount, @dial_size)
    new_counter = if new_pos == 0, do: counter + 1, else: counter
    {new_pos, new_counter}
  end

  defp rotate(position, {:right, amount}, counter) do
    new_pos = Integer.mod(position + amount, @dial_size)
    new_counter = if new_pos == 0, do: counter + 1, else: counter
    {new_pos, new_counter}
  end
end
