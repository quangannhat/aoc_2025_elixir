defmodule Solutions do
  @input_dir Path.join(__DIR__, "solutions")

  def input_path(filename \\ "input.txt") do
    Path.join(@input_dir, filename)
  end
end
