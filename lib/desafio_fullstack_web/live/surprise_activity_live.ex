defmodule DesafioFullstackWeb.SurpriseActivityLive do
  use Phoenix.LiveView
  alias DesafioFullstack.Activities

  @image_base_url "https://picsum.photos/1200/400.webp"

  def mount(_params, _session, socket) do
    activity = Activities.get_random_activity()
    image_url = get_random_image()
    {:ok, assign(socket, activity: activity, image_url: image_url, loading: true)}
  end

  def handle_event("get_new_activity", _value, socket) do
    # Set loading state to true
    socket = assign(socket, :loading, true)
    activity = Activities.get_random_activity()
    image_url = get_random_image()
    {:noreply, assign(socket, activity: activity, image_url: image_url, loading: true)}
  end

  def handle_event("image_loaded", _params, socket) do
    # Set loading state to false when image is fully loaded
    {:noreply, assign(socket, loading: false)}
  end

  defp get_random_image do
    "#{@image_base_url}?random=#{:rand.uniform(1000)}"
  end
end
