defmodule DesafioOincWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias DesafioOincWeb.Schema.Resolvers.{User, Contact, Phone}

  import_types(DesafioOincWeb.Schema.Types.User)

  object :root_query do
    field :get_user, type: :user do
      description("Retrieves a user by ID or CPF")
      arg(:user_id, :string)
      arg(:cpf, :string)
      resolve(&User.get/2)
    end

    field :get_contact, type: :contact do
      description("Retrieves a contact by ID or CPF")
      arg(:user_id, :string)
      resolve(&Contact.get/2)
    end

    field :get_phone, type: :phones do
      description("Retrieves a phone by ID or CPF")
      arg(:user_id, :string)
      resolve(&Phone.get/2)
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      description("Create a new user")
      arg(:input, :create_user_input)
      resolve(&User.create/2)
    end

    field :create_contact, type: :contact do
      description("Create a new contact")
      arg(:input, :create_contact_input)
      resolve(&Contact.create/2)
    end

    field :create_phone, type: :phone do
      description("Create a new phone")
      arg(:input, :create_phone_input)
      resolve(&Phone.create/2)
    end
  end
end
