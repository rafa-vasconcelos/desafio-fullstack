defmodule DesafioFullstack.ActivitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DesafioFullstack.Activities` context.
  """

  @doc """
  Generate a activity.
  """
  def activity_fixture(attrs \\ %{}) do
    {:ok, activity} =
      attrs
      |> Enum.into(%{
        description: "some description",
        google_maps_location: "some google_maps_location",
        instagram: "some instagram",
        tags: ["option1", "option2"],
        title: "some title"
      })
      |> DesafioFullstack.Activities.create_activity()

    activity
  end
end
