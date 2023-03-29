defmodule OincExercise.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :cpf, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:cpf])
  end
end
