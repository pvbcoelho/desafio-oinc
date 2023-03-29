defmodule DesafioOinc.Phone do
  @moduledoc """
  The boundary for the system.
  """
  alias DesafioOinc.CommandedApplication
  alias DesafioOinc.Commands.CreatePhone
  alias DesafioOinc.User

  @doc """
  Creates a new phone.
  """
  def create_phone(attrs) do
    with {:ok, %CreatePhone{} = phone} <- CreatePhone.new_phone(attrs),
         :ok <- CommandedApplication.dispatch(phone, consistency: :strong) do
      {:ok, phone}
    end
  end

  def get_phones(%{user_id: id}) do
    case User.get_user(%{user_id: id})do
      {:error, "User not found"} -> {:error, "User not found"}
      {:ok, user} -> {:ok, Map.put(%{}, :phones, user.phones)}
    end
  end

end
