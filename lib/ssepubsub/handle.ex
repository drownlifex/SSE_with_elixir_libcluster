defmodule Ssepubsub.Handle do
  import Plug.Conn

  def stream(conn, topic) do
    Phoenix.PubSub.subscribe(Ssepubsub.PubSub, topic)

    conn
    |> put_resp_content_type("text/event-stream")
    |> put_resp_header("cache-control", "no-cache")
    |> send_chunked(200)
    |> loop()
  end

  defp loop(conn) do
    receive do
      {:msg, msg} ->
        chunk(conn, "data: #{msg}\n\n")
        loop(conn)
    end
  end
end
