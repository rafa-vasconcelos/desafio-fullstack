defmodule DesafioFullstack.Activities do
  import Ecto.Query, warn: false
  alias DesafioFullstack.Repo
  alias DesafioFullstack.Activities.Activity

  def list_activities do
    Repo.all(Activity)
  end

  def get_activity!(id), do: Repo.get!(Activity, id)

  def create_activity(attrs \\ %{}) do
    %Activity{}
    |> Activity.changeset(attrs)
    |> Repo.insert()
  end

  def update_activity(%Activity{} = activity, attrs) do
    activity
    |> Activity.changeset(attrs)
    |> Repo.update()
  end

  def delete_activity(%Activity{} = activity) do
    Repo.delete(activity)
  end

  def change_activity(%Activity{} = activity, attrs \\ %{}) do
    Activity.changeset(activity, attrs)
  end

  def get_random_activity do
    Activity
    |> Repo.all()
    |> Enum.random()
  end

  def search_activities(query) do
    from(a in Activity,
      where: ilike(a.title, ^"%#{query}%") or ilike(a.description, ^"%#{query}%")
    )
    |> Repo.all()
  end

  def get_activity_by_title(title) do
    Repo.get_by(Activity, title: title)
  end
end
