defmodule OincExercise.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string, null: false
      add :user_id, references(:users, type: :uuid), null: false

      timestamps()
    end

    create unique_index(:contacts, [:email])
    create unique_index(:contacts, [:user_id])
  end
end
