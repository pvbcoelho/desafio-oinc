defmodule DesafioOincWeb.Schema.Resolvers.Contact do
  alias DesafioOinc.Contact

  def get(attrs, _context), do: Contact.get_contact(attrs)
  def create(%{input: input} = _attrs, _context), do: Contact.create_contact(input)
end
