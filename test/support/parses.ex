defmodule Parses do
  def parse_user(user) do
    %{
      "data" => %{
        "getUser" => %{
          "id" => user.id,
          "name" => user.name,
          "cpf" => user.cpf,
          "contact" => parse_contact(user.contact),
          "phones" => parse_phone(user.phones)
        }
      }
    }
  end

  def parse_contact(contact) do
    %{
      "id" => contact.id,
      "userId" => contact.user_id,
      "email" => contact.email
    }
  end

  def parse_phone(phones) do
    phones
    |> Enum.map(fn phone ->
      %{
        "id" => phone.id,
        "contactId" => phone.contact_id,
        "ddd" => phone.ddd,
        "phoneNumber" => phone.phone_number
      }
    end)
  end
end
