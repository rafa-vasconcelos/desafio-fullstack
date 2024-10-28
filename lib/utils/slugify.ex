# lib/desafio_fullstack/utils/slugify.ex
defmodule DesafioFullstack.Utils.Slugify do
  def slugify(title) do
    title
    |> String.downcase()
    # Remove special characters
    |> String.replace(~r/[^\w\s-]/, "")
    # Replace spaces with hyphens
    |> String.replace(~r/\s+/, "-")
  end
end
