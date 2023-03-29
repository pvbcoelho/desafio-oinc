defmodule Mix.Tasks.EventStore do
  use Mix.Task

  def run(_) do
    config = Application.get_env(:desafio_oinc, DesafioOinc.EventStore)
    Mix.shell().cmd("createdb -h #{config[:hostname]} -p #{config[:port]} -U #{config[:username]} #{config[:database]}")
  end
end
