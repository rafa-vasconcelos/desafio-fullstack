defmodule DesafioFullstack.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :instagram, :string
      add :google_maps_location, :string
      add :tags, {:array, :string}

      timestamps(type: :utc_datetime)
    end
  end
end
