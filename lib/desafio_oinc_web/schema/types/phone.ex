defmodule DesafioOincWeb.Schema.Types.Phone do
  use Absinthe.Schema.Notation

  @desc "A phone"
  object :phone do
    field(:id, non_null(:string))
    field(:ddd, non_null(:integer))
    field(:contact_id, non_null(:string))
    field(:phone_number, non_null(:string))
  end

  @desc "A phones"
  object :phones do
    field(:phones, list_of(:phone))
  end

  @desc "A input phone"
  input_object :create_phone_input do
    field(:ddd, non_null(:integer))
    field(:phone_number, non_null(:string))
    field(:contact_id, non_null(:string))
  end
end
