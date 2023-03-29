defmodule DesafioOincWeb.Schema.Resolvers.Phone do
  alias DesafioOinc.Phone

  def get(attrs, _context), do: Phone.get_phones(attrs)
  def create(%{input: input} = _attrs, _context), do: Phone.create_phone(input)
end
