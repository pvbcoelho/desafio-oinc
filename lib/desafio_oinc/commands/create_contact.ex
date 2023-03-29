defmodule DesafioOinc.Commands.CreateContact do
  @moduledoc """
  Command to create a new contact.
  """
  use ExConstructor

  alias DesafioOinc.Projections.Contact
  alias DesafioOinc.User
  alias DesafioOinc.Validators.Contact.UniqueEmail
  alias Uniq.UUID

  @type t :: %__MODULE__{
          id: UUID.t(),
          email: String.t(),
          user_id: UUID.t()
        }

  defstruct id: "", email: "", user_id: ""

  def new_contact(attrs) do
    __MODULE__.new(attrs)
    |> assign_uuid()
    |> validate_new_contact(attrs)
  end

  defp assign_uuid(%__MODULE__{} = contact) do
    uuid = UUID.uuid4()
    %__MODULE__{contact | id: uuid}
  end

  defp validate_new_contact(%__MODULE__{} = new_contact, attrs) do
    with %{valid?: true} <- Contact.changeset(%Contact{}, attrs),
         :ok <- UniqueEmail.validate(new_contact),
         {:ok, _user} <- User.get_user(%{user_id: new_contact.user_id}) do
      {:ok, new_contact}
    end
  end
end
