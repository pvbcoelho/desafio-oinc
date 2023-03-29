defmodule DesafioOincWeb.Schema.Resolvers.User do
  alias DesafioOinc.User

  def get(attrs, _context), do: User.get_user(attrs)
  def create(%{input: input} = _attrs, _context), do: User.create_user(input)
end
