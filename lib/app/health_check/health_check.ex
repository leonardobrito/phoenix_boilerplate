defmodule App.HealthCheck do
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{request_path: "/health_check"} = conn, _opts) do
    conn
    |> send_resp(200, Jason.encode!(%{"status" => "It's working!"}))
    |> halt()
  end

  def call(conn, _opts), do: conn
end
