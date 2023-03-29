defmodule DesafioOinc.Projectors.User do
  use Commanded.Projections.Ecto,
    application: DesafioOinc.CommandedApplication,
    name: "Projectors.User",
    consistency: :strong

  require Logger

  alias DesafioOinc.Events.UserCreated
  alias DesafioOinc.Projections.User

  project(%UserCreated{} = user, fn multi ->
    Ecto.Multi.insert(multi, :user, %User{
      id: user.id,
      name: user.name,
      cpf: user.cpf
    })
  end)

  def error(error, _event, _failure_context) do
    Logger.error(fn -> "Failed due to constraint error: " <> inspect(error) end)

    :skip
  end
end
