defmodule TitleFetch.CLI do
  def main(sites) do
    TitleFetch.fetch(List.first(sites))
  end

end

TitleFetch.CLI.main(System.argv())
