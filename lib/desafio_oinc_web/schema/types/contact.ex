defmodule DesafioOincWeb.Schema.Types.Contact do
  use Absinthe.Schema.Notation

  @desc "A user contact"
  object :contact do
    field(:id, non_null(:string))
    field(:email, non_null(:string))
    field(:user_id, non_null(:string))
  end

  @desc "A input user contact"
  input_object :create_contact_input do
    field(:email, non_null(:string))
    field(:user_id, non_null(:string))
  end
end
