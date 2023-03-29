defmodule DesafioOinc.Events.ContactCreated do
  @derive Jason.Encoder
  defstruct [
    :id,
    :email,
    :user_id
  ]
end
