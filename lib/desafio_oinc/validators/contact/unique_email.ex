defmodule DesafioOinc.Validators.Contact.UniqueEmail do
  alias DesafioOinc.Commands.CreateContact
  alias DesafioOinc.Contact
  alias DesafioOinc.Projections.Contact
  alias DesafioOinc.Repo

  @spec validate(CreateContact.t()) :: :ok | {:error, messaeg :: String.t()}
  def validate(%CreateContact{} = contact) do
    case Repo.get_by(Contact, email: contact.email) do
      nil -> :ok
      _ -> {:error, "email already been taken"}
    end
  end
end
