defmodule DesafioOinc.Validators.User.UniqueCpf do
  alias DesafioOinc.Commands.CreateUser
  alias DesafioOinc.User

  @spec validate(CreateUser.t()) :: :ok | {:error, message :: String.t()}
  def validate(%CreateUser{} = user) do
    case User.get_user(%{cpf: user.cpf}) do
      {:error, "User not found"} -> :ok
      _ -> {:error, "cpf already been taken"}
    end
  end
end
