defmodule Solutions.Day1 do
  def solve do
    Solutions.input_path
    |> File.read
    |> parse_input
  end

  def parse_input({:ok, text}) do
    text
  end

  def parse_input({:error, _}) do
    "Parse error"
  end
end
