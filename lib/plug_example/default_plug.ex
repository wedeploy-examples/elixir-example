defmodule PlugExample.DefaultPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    page_contents = EEx.eval_file("templates/index.eex", [])
    conn |> put_resp_content_type("text/html") |> send_resp(200, page_contents)
  end
end
