defmodule DesafioOinc.Commanded.Router do
  use Commanded.Commands.Router

  alias DesafioOinc.Aggregates.{User, Contact, Phone}
  alias DesafioOinc.Commands.{CreateUser, CreateContact, CreatePhone}

  identify(User, by: :id)
  identify(Contact, by: :id)
  identify(Phone, by: :id)

  dispatch(
    [
      CreateUser
    ],
    to: User
  )

  dispatch(
    [
      CreateContact
    ],
    to: Contact
  )

  dispatch(
    [
      CreatePhone
    ],
    to: Phone
  )
end
