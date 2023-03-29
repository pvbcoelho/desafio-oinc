defmodule DesafioOinc.Commands.CreateUser do
  @moduledoc """
  Command to create a new user with associated contact and phones.
  """
  use ExConstructor

  alias DesafioOinc.Projections.User
  alias DesafioOinc.Validators.User.UniqueCpf
  alias Uniq.UUID

  @type t :: %__MODULE__{
          id: UUID.t(),
          name: String.t(),
          cpf: String.t()
        }

  defstruct name: "", cpf: "", id: ""

  def new_user(attrs) do
    __MODULE__.new(attrs)
    |> assign_uuid()
    |> validate_new_user(attrs)
  end

  defp assign_uuid(%__MODULE__{} = user) do
    uuid = UUID.uuid4()
    %__MODULE__{user | id: uuid}
  end

  defp validate_new_user(%__MODULE__{} = new_user, attrs) do
    with %{valid?: true} <- User.changeset(%User{}, attrs),
         :ok <- UniqueCpf.validate(new_user) do
      {:ok, new_user}
    end
  end
end
