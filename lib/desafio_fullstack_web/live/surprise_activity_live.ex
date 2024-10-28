defmodule DesafioFullstackWeb.SurpriseActivityLive do
  use Phoenix.LiveView
  alias DesafioFullstack.Activities
  import DesafioFullstack.Utils.Slugify

  @image_base_url "https://picsum.photos/1200/400.webp"
  @tags [
    "esportes",
    "museus",
    "parques",
    "gratuito",
    "bom para crianças",
    "bom para casais",
    "natureza",
    "paisagem",
    "beleza natural",
    "ponto turístico",
    "bom para grupos",
    "doces",
    "salgados"
  ]

  def mount(_params, _session, socket) do
    activity = Activities.get_random_activity()
    image_url = get_random_image()

    {:ok,
     assign(socket,
       activity: activity,
       image_url: image_url,
       loading: true,
       tags: @tags,
       search_results: [],
       search_query: "",
       selected_tags: []
     )}
  end

  def handle_event("toggle_tag", %{"tag" => tag}, socket) do
    updated_tags =
      case tag in socket.assigns.selected_tags do
        # Remove the tag if it exists
        true -> List.delete(socket.assigns.selected_tags, tag)
        # Append the tag to the end of the list
        false -> socket.assigns.selected_tags ++ [tag]
      end

    {:noreply, assign(socket, selected_tags: updated_tags)}
  end

  def handle_event("remove_tag", %{"tag" => tag}, socket) do
    updated_tags = List.delete(socket.assigns.selected_tags, tag)

    {:noreply, assign(socket, selected_tags: updated_tags)}
  end

  def handle_event("get_new_activity", _value, socket) do
    socket = assign(socket, :loading, true)
    activity = Activities.get_random_activity()
    image_url = get_random_image()
    {:noreply, assign(socket, activity: activity, image_url: image_url, loading: true)}
  end

  def handle_event("search_activities", %{"query" => query}, socket) do
    selected_tags = socket.assigns.selected_tags || []
    search_results = Activities.search_activities(query, selected_tags)
    {:noreply, assign(socket, search_results: search_results, search_query: query)}
  end

  defp get_random_image do
    "#{@image_base_url}?random=#{:rand.uniform(1000)}"
  end
end
