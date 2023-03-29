defmodule DesafioOinc.Events.UserCreated do
  @derive Jason.Encoder
  defstruct [
    :id,
    :name,
    :cpf
  ]
end
