defmodule DesafioOincWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  import_types(DesafioOincWeb.Schema.Types.Phone)
  import_types(DesafioOincWeb.Schema.Types.Contact)

  @desc "A user"
  object :user do
    field(:id, non_null(:string))
    field(:name, non_null(:string))
    field(:cpf, non_null(:string))
    field(:contact, :contact)
    field(:phones, list_of(:phone))
  end

  @desc "Input user"
  input_object :create_user_input do
    field(:name, non_null(:string))
    field(:cpf, non_null(:string))
  end
end
