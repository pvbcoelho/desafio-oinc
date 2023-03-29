defmodule DesafioOinc.Projections.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :cpf]

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id

  schema "users" do
    field :name, :string
    field :cpf, :string
    has_one :contact, DesafioOinc.Projections.Contact, on_delete: :delete_all
    has_many :phones, through: [:contact, :phones], on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields ++ [:id])
    |> validate_required(@fields)
    |> unique_constraint(:cpf)
  end
end
