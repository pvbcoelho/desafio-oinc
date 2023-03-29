defmodule DesafioOinc.Aggregates.Phone do
  defstruct [
    :id,
    :contact_id,
    :ddd,
    :phone_number
  ]

  alias DesafioOinc.Aggregates.Phone
  alias DesafioOinc.Commands.CreatePhone
  alias DesafioOinc.Events.PhoneCreated

  @doc """
  Register a new phone
  """

  def execute(%Phone{id: nil}, %CreatePhone{} = create) do
    %PhoneCreated{
      id: create.id,
      contact_id: create.contact_id,
      ddd: create.ddd,
      phone_number: create.phone_number
    }
  end

  def apply(%Phone{} = phone, %PhoneCreated{} = created) do
    %Phone{
      phone
      | id: created.id,
        contact_id: created.contact_id,
        ddd: created.ddd,
        phone_number: created.phone_number
    }
  end
end
