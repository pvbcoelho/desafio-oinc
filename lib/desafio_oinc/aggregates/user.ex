defmodule DesafioOinc.Aggregates.User do
  defstruct [
    :id,
    :name,
    :cpf
  ]

  alias DesafioOinc.Aggregates.User
  alias DesafioOinc.Commands.CreateUser
  alias DesafioOinc.Events.UserCreated

  @doc """
  Register a new user
  """

  def execute(%User{id: nil}, %CreateUser{} = create) do
    %UserCreated{
      id: create.id,
      name: create.name,
      cpf: create.cpf
    }
  end

  def apply(%User{} = user, %UserCreated{} = created) do
    %User{
      user
      | id: created.id,
        name: created.name,
        cpf: created.cpf
    }
  end
end
