defmodule TitleFetch do
  require Logger

  @moduledoc """
  Documentation for TitleFetch.
  """

  def fetch(url) do
    IO.puts(url)

    case HTTPoison.get(url, [], hackney: [ssl_options: [verify: :verify_none]]) do
      {:ok, %HTTPoison.Response{} = response} ->
        {:ok, process_response(response, url)}

      {:error, %HTTPoison.Error{} = error} ->
        error
        |> inspect()
        |> Logger.error()

        {:error, error}
    end
  end

  defp get_header(headers, header) do
    case Enum.find(headers, fn {h, _v} -> h == header end) do
      {^header, value} -> value
      _ -> nil
    end
  end

  defp process_response(
         %HTTPoison.Response{
           status_code: status_code,
           headers: headers,
           body: body
         } = response,
         url
       ) do
    cond do
      status_code == 200 ->
        content_type = get_header(headers, "Content-Type")
        content_size = get_header(headers, "Content-Length")
        links = get_links(body)

        IO.puts("#{url} -> #{get_title(body)} #{content_type} #{content_size}")

      status_code in [301, 302, 303, 307, 308] ->
        location = get_header(headers, "Location")
        fetch(location)

      true ->
        IO.puts("Error status code #{status_code}")
    end
  end

  defp get_language(body) do
    body
    |> Floki.find("html")
    |> Floki.attribute("lang")
  end

  defp get_title(body) do
    body
    |> Floki.find("head > title")
    |> Floki.text()
  end

  defp get_links(body) do
    body
    |> Floki.find("a")
    |> Floki.attribute("href")
    |> Enum.filter(fn link -> Regex.match?(~r/^https?:/, link) end)
  end
end
