defmodule DesafioOinc.Contact do
  alias DesafioOinc.CommandedApplication
  alias DesafioOinc.Commands.CreateContact
  alias DesafioOinc.Projections.Contact
  alias DesafioOinc.Repo

  @doc """
  Creates a new contac.
  """
  def create_contact(attrs) do
    with {:ok, %CreateContact{} = contact} <- CreateContact.new_contact(attrs),
         :ok <- CommandedApplication.dispatch(contact, consistency: :strong) do
      {:ok, contact}
    end
  end

  def get_contact(%{user_id: user_id}) do
    case Repo.get_by(Contact, user_id: user_id) do
      nil -> {:error, "Contact not found"}
      contact -> {:ok, contact}
    end
  end

  def get_contact(%{contact_id: id}) do
    case Repo.get_by(Contact, id: id) do
      nil -> {:error, "Contact not found"}
      contact -> {:ok, contact}
    end
  end
end
