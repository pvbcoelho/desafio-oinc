defmodule DesafioOinc.Supervisors.PhoneSupervisor do
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_init_arg) do
    children = [
      DesafioOinc.Projectors.Phone
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
