defmodule Solutions do
  @solutions_dir Path.join(__DIR__, "solutions")

  def input_path(day, filename \\ "input.txt") do
    Path.join([@solutions_dir, "day_#{day}", filename])
  end
end
