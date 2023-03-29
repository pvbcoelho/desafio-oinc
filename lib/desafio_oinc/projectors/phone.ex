defmodule DesafioOinc.Projectors.Phone do
  use Commanded.Projections.Ecto,
    application: DesafioOinc.CommandedApplication,
    name: "Projectors.Phone",
    consistency: :strong

  require Logger

  alias DesafioOinc.Events.PhoneCreated
  alias DesafioOinc.Projections.Phone

  project(%PhoneCreated{} = phone, fn multi ->
    Ecto.Multi.insert(multi, :phone, %Phone{
      id: phone.id,
      contact_id: phone.contact_id,
      ddd: phone.ddd,
      phone_number: phone.phone_number
    })
  end)

  def error(error, _event, _failure_context) do
    Logger.error(fn -> "Failed due to constraint error: " <> inspect(error) end)

    :skip
  end
end
