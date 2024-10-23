defmodule DesafioFullstack.Activities.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "activities" do
    field :description, :string
    field :title, :string
    field :instagram, :string
    field :google_maps_location, :string
    field :tags, {:array, :string}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:title, :description, :instagram, :google_maps_location, :tags])
    |> validate_required([:title, :description, :instagram, :google_maps_location, :tags])
  end
end
