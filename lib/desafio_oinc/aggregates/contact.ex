defmodule DesafioOinc.Aggregates.Contact do
  defstruct [
    :id,
    :user_id,
    :email
  ]

  alias DesafioOinc.Aggregates.Contact
  alias DesafioOinc.Commands.CreateContact
  alias DesafioOinc.Events.ContactCreated

  @doc """
  Register a new contact
  """

  def execute(%Contact{id: nil}, %CreateContact{} = create) do
    %ContactCreated{
      id: create.id,
      user_id: create.user_id,
      email: create.email
    }
  end

  def apply(%Contact{} = contact, %ContactCreated{} = created) do
    %Contact{
      contact
      | id: created.id,
        user_id: created.user_id,
        email: created.email
    }
  end
end
