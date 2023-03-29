defmodule DesafioOinc.User do
  alias DesafioOinc.CommandedApplication
  alias DesafioOinc.Commands.CreateUser
  alias DesafioOinc.Projections.User
  alias DesafioOinc.Repo

  @doc """
  Creates a new user.
  """
  def create_user(attrs) do
    with {:ok, %CreateUser{} = user} <- CreateUser.new_user(attrs),
         :ok <- CommandedApplication.dispatch(user, consistency: :strong) do
      {:ok, user}
    end
  end

  def get_user(%{cpf: cpf}) do
    User
    |> Repo.get_by(cpf: cpf)
    |> Repo.preload([:contact, :phones])
    |> case do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  def get_user(%{user_id: id}) do
    User
    |> Repo.get_by(id: id)
    |> Repo.preload([:contact, :phones])
    |> case do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
