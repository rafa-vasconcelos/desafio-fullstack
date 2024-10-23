defmodule DesafioFullstackWeb.ActivitiesController do
  use DesafioFullstackWeb, :controller
  alias DesafioFullstack.Activities

  def surprise_activity(conn, _params) do
    activity = Activities.get_random_activity()
    render(conn, "surprise_activity.json", activity: activity)
  end
end
