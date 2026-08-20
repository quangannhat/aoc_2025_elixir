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

  defp calc_answer(rotations) do
    rotations
    |> Enum.reduce({@starting_point, 0}, fn rotation, {position, counter} ->
      rotate(position, rotation, counter)
    end)
    |> elem(1)
  end

  defp rotate(position, {direction, amount}, counter) do
    movement =
      case direction do
        :left -> -amount
        :right -> amount
      end

    new_position = Integer.mod(position + movement, @dial_size)
    new_counter = counter + if(new_position == 0, do: 1, else: 0)

    {new_position, new_counter}
  end

  # defp calc_answer(input, acc \\ @starting_point, counter \\ 0) do
  #   case input do
  #     [] ->
  #       counter
  #
  #     [rotation | remaining] ->
  #       {new_pos, new_counter} = rotate(acc, rotation, counter)
  #       calc_answer(remaining, new_pos, new_counter)
  #   end
  # end
end
