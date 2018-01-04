defmodule USP.Restaurants do
  use HTTPoison.Base

  @endpoint "https://uspdigital.usp.br/rucard/servicos/restaurants"

  @hash_body "hash=#{Application.get_env(:usp, :hash)}"

  def get() do
    post("", "")
  end

  def get!() do
    post("", "")
  end

  defp process_url(url) do
    @endpoint <> url
  end

  defp normalize_restaurants(restaurants) do
    restaurant_atom = fn (restaurant) ->
      String.to_atom(Slug.slugify(restaurant.alias, separator: ?_))
    end

    restaurants |> List.foldl(
      %{}, fn(restaurant, map) ->
        Map.put(map, restaurant_atom.(restaurant), restaurant)
      end
    )
  end

  defp normalize_campi(campi) do
    campus_atom = fn (campus) ->
      String.to_atom(Slug.slugify(campus.name, separator: ?_))
    end
    normalize_campus = fn (campus) ->
      campus |> Map.put(:restaurants, normalize_restaurants(campus.restaurants))
    end

    campi |> List.foldl(
      %{}, fn(campus, map) ->
        Map.put(map, campus_atom.(campus), normalize_campus.(campus))
      end
    )
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!(as: [ %USP.Campus{} ])
    |> normalize_campi
  end

  defp process_request_headers(headers) do
    [{"Content-Type", "application/x-www-form-urlencoded"} | headers]
  end

  defp process_request_body("") do
    @hash_body
  end

  defp process_request_body(body) do
    @hash_body <> body
  end

  defp process_request_options(options) do
    options
  end
end
