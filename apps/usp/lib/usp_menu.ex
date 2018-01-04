defmodule USP.Menus do
  use HTTPoison.Base

  @endpoint "https://uspdigital.usp.br/rucard/servicos/menu/"

  @hash_body "hash=#{Application.get_env(:usp, :hash)}"

  def get(restaurant) when is_number(restaurant) do
    post(restaurant, "")
  end

  def get!(restaurant) when is_number(restaurant) do
    post(restaurant, "")
  end

  defp process_url(url) do
    @endpoint <> url
  end

  defp process_response_body(body) do
    body
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
