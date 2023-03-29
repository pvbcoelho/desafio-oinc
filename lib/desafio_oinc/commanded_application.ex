defmodule DesafioOinc.CommandedApplication do
  use Commanded.Application,
    otp_app: :desafio_oinc,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: DesafioOinc.EventStore
    ],
    pub_sub: :local,
    registry: :local

  router(DesafioOinc.Commanded.Router)
end
