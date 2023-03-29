defmodule DesafioOinc.Validators.Phone.UniqueDddNumberContactId do
  alias DesafioOinc.Commands.CreatePhone
  alias DesafioOinc.Phone
  alias DesafioOinc.Projections.Phone
  alias DesafioOinc.Repo

  @spec validate(CreatePhone.t()) :: :ok | {:error, messaeg :: String.t()}
  def validate(%CreatePhone{} = phone) do
    case Repo.get_by(Phone,
           contact_id: phone.contact_id,
           ddd: phone.ddd,
           phone_number: phone.phone_number
         ) do
      nil -> :ok
      _ -> {:error, "user already has this phone"}
    end
  end
end
