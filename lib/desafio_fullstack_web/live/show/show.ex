defmodule DesafioFullstackWeb.ActivityLive.Show do
  use Phoenix.LiveView
  alias DesafioFullstack.Activities

  def mount(%{"title" => title_slug}, _session, socket) do
    title = deslugify(title_slug)

    activity = Activities.get_activity_by_title(title)

    {:ok, assign(socket, activity: activity)}
  end

  defp deslugify(slug) do
    slug
    |> String.replace("-", " ")
    |> String.split()
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
end
