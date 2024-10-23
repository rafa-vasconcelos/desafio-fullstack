defmodule DesafioFullstack.ActivitiesTest do
  use DesafioFullstack.DataCase

  alias DesafioFullstack.Activities

  describe "activities" do
    alias DesafioFullstack.Activities.Activity

    import DesafioFullstack.ActivitiesFixtures

    @invalid_attrs %{description: nil, title: nil, instagram: nil, google_maps_location: nil, tags: nil}

    test "list_activities/0 returns all activities" do
      activity = activity_fixture()
      assert Activities.list_activities() == [activity]
    end

    test "get_activity!/1 returns the activity with given id" do
      activity = activity_fixture()
      assert Activities.get_activity!(activity.id) == activity
    end

    test "create_activity/1 with valid data creates a activity" do
      valid_attrs = %{description: "some description", title: "some title", instagram: "some instagram", google_maps_location: "some google_maps_location", tags: ["option1", "option2"]}

      assert {:ok, %Activity{} = activity} = Activities.create_activity(valid_attrs)
      assert activity.description == "some description"
      assert activity.title == "some title"
      assert activity.instagram == "some instagram"
      assert activity.google_maps_location == "some google_maps_location"
      assert activity.tags == ["option1", "option2"]
    end

    test "create_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_activity(@invalid_attrs)
    end

    test "update_activity/2 with valid data updates the activity" do
      activity = activity_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", instagram: "some updated instagram", google_maps_location: "some updated google_maps_location", tags: ["option1"]}

      assert {:ok, %Activity{} = activity} = Activities.update_activity(activity, update_attrs)
      assert activity.description == "some updated description"
      assert activity.title == "some updated title"
      assert activity.instagram == "some updated instagram"
      assert activity.google_maps_location == "some updated google_maps_location"
      assert activity.tags == ["option1"]
    end

    test "update_activity/2 with invalid data returns error changeset" do
      activity = activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_activity(activity, @invalid_attrs)
      assert activity == Activities.get_activity!(activity.id)
    end

    test "delete_activity/1 deletes the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{}} = Activities.delete_activity(activity)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_activity!(activity.id) end
    end

    test "change_activity/1 returns a activity changeset" do
      activity = activity_fixture()
      assert %Ecto.Changeset{} = Activities.change_activity(activity)
    end
  end
end
