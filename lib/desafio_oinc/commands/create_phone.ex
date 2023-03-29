defmodule DesafioOinc.Commands.CreatePhone do
  @moduledoc """
  Command to create a new phone.
  """
  use ExConstructor

  alias DesafioOinc.Projections.Phone
  alias DesafioOinc.Contact
  alias DesafioOinc.Validators.Phone.UniqueDddNumberContactId
  alias Uniq.UUID

  @type t :: %__MODULE__{
          id: UUID.t(),
          contact_id: UUID.t(),
          ddd: Integer.t(),
          phone_number: String.t()
        }

  defstruct id: "", contact_id: "", ddd: 0, phone_number: ""

  def new_phone(attrs) do
    __MODULE__.new(attrs)
    |> assign_uuid()
    |> validate_new_phone(attrs)
  end

  defp assign_uuid(%__MODULE__{} = phone) do
    uuid = UUID.uuid4()
    %__MODULE__{phone | id: uuid}
  end

  defp validate_new_phone(%__MODULE__{} = new_phone, attrs) do
    with %{valid?: true} <- Phone.changeset(%Phone{}, attrs),
         :ok <- UniqueDddNumberContactId.validate(new_phone),
         {:ok, _contact} <- Contact.get_contact(%{contact_id: new_phone.contact_id}) do
      {:ok, new_phone}
    end
  end
end
