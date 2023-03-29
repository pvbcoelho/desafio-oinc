defmodule DesafioOinc.Projections.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  alias Uniq.UUID

  @fields [:email, :user_id]

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id

  schema "contacts" do
    field :email, :string
    belongs_to :user, DesafioOinc.Projections.User

    has_many :phones, DesafioOinc.Projections.Phone

    timestamps()
  end

  def changeset(contact, attrs) do
    contact
    |> cast(attrs, @fields ++ [:id])
    |> validate_required(@fields)
    |> validate_uuid(attrs.user_id)
    |> unique_constraint(:email)
    |> unique_constraint(:user_id)
    |> foreign_key_constraint(:user_id)
  end

  defp validate_uuid(%{valid?: false} = changeset, _field), do: changeset

  defp validate_uuid(changeset, field) do
    case UUID.valid?(field) do
      true -> changeset
      false -> add_error(changeset, :user_id, "Invalid uuid")
    end
  end
end
