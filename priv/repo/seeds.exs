alias DesafioFullstack.Repo
alias DesafioFullstack.Activities.Activity

# Function to generate random activities
defmodule SeedHelper do
  def random_activity do
    title = Faker.Lorem.words(3) |> Enum.join(" ") |> capitalize_title()

    %{
      title: title,  # Título com até três palavras, com primeira letra de cada palavra maiúscula
      description: Faker.Lorem.paragraph(),
      instagram: "https://instagram.com/" <> Faker.Internet.slug(),  # Link Instagram falso
      google_maps_location: "https://maps.google.com/" <> Faker.Internet.slug(),  # Link Google Maps falso
      tags: Enum.take_random(
        ["esportes", "museus", "parques", "gratuito", "bom para crianças", "bom para casais", "natureza", "paisagem", "beleza natural", "ponto turístico", "bom para grupos", "doces", "salgados"],
        Enum.random(4..8)
      ) # 4 a 8 tags aleatórias
    }
  end

  # Function to capitalize the first letter of each word in a string
  defp capitalize_title(title) do
    title
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
end

# Remove dados da database
Repo.delete_all(Activity)

# Insere 100 atividades
1..100
|> Enum.each(fn _ ->
  %Activity{}
  |> Activity.changeset(SeedHelper.random_activity())
  |> Repo.insert!()
end)
