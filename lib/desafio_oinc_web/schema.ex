defmodule DesafioOincWeb.Schema do
  use Absinthe.Schema

  import_types(DesafioOincWeb.Schema.Types.Root)

  query do
    description("All available queries")
    import_fields(:root_query)
  end

  mutation do
    description("All available mutations")
    import_fields(:root_mutation)
  end
end
