defmodule DesafioOinc.Events.PhoneCreated do
  @derive Jason.Encoder
  defstruct [
    :id,
    :contact_id,
    :ddd,
    :phone_number
  ]
end
