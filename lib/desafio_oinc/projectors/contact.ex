defmodule DesafioOinc.Projectors.Contact do
  use Commanded.Projections.Ecto,
    application: DesafioOinc.CommandedApplication,
    name: "Projectors.Contact",
    consistency: :strong

  require Logger

  alias DesafioOinc.Events.ContactCreated
  alias DesafioOinc.Projections.Contact

  project(%ContactCreated{} = contact, fn multi ->
    Ecto.Multi.insert(multi, :contact, %Contact{
      id: contact.id,
      user_id: contact.user_id,
      email: contact.email
    })
  end)

  def error(error, _event, _failure_context) do
    Logger.error(fn -> "Failed due to constraint error: " <> inspect(error) end)

    :skip
  end
end
