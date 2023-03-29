defmodule DesafioOinc.Projections.Phone do
  use Ecto.Schema
  import Ecto.Changeset

  alias Uniq.UUID

  @fields [:ddd, :phone_number, :contact_id]

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id

  schema "phones" do
    field :ddd, :integer
    field :phone_number, :string

    belongs_to :contact, DesafioOinc.Projections.Contact

    timestamps()
  end

  @doc false
  def changeset(phone, attrs) do
    phone
    |> cast(attrs, @fields ++ [:id])
    |> validate_required(@fields)
    |> validate_uuid(attrs.contact_id)
    |> unique_constraint([:ddd, :phone_number, :contact_id], name: :unique_phone_per_contact)
    |> foreign_key_constraint(:contact_id)
  end

  defp validate_uuid(%{valid?: false} = changeset, _field), do: changeset

  defp validate_uuid(changeset, field) do
    case UUID.valid?(field) do
      true -> changeset
      false -> add_error(changeset, :contact_id, "Invalid uuid")
    end
  end
end
