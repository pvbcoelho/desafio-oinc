defmodule OincExercise.Repo.Migrations.CreatePhones do
  use Ecto.Migration

  def change do
    create table(:phones, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :ddd, :integer, null: false
      add :phone_number, :string, size: 9, null: false
      add :contact_id, references(:contacts, type: :uuid), null: false
      timestamps()
    end

    create unique_index(:phones, [:ddd, :phone_number, :contact_id],
             name: "unique_phone_per_contact"
           )
  end
end
