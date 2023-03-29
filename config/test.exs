import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.

# Configure your database
config :desafio_oinc, DesafioOinc.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "desafio_oinc_test",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Configures the event store database
config :desafio_oinc, DesafioOinc.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "desafio_oinc_event_store_test",
  hostname: "localhost",
  pool_size: 1,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox


# We don't run a server during test. If one is required,
# you can enable the server option below.
config :desafio_oinc, DesafioOincWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "THC6ZPcRSeovF7m7VMArJNZKEZb2ROfenxVfYu47yvGoxaI/gx9JVUvjd5QJq9Ja",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
