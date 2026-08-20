defmodule Mix.Tasks.Solve do
  use Mix.Task

  @shortdoc "Runs the solution for an Advent of Code day"

  @impl Mix.Task
  def run([day]) do
    with {day, ""} when day in 1..25 <- Integer.parse(day),
         module = Module.concat(Solutions, "Day#{day}"),
         true <- Code.ensure_loaded?(module),
         true <- function_exported?(module, :solve, 0) do
      module.solve() |> IO.inspect()
    else
      _ -> Mix.raise("expected an implemented day from 1 to 25, for example: mix solve 1")
    end
  end

  def run(_args) do
    Mix.raise("usage: mix solve DAY")
  end
end
