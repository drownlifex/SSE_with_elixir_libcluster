defmodule Ssepubsub.Router do
    use Plug.Router

  plug :match
  plug :dispatch

  get "/sse" do
    topic = conn.params["topic"] || "default"
    Ssepubsub.Handle.stream(conn, topic)
  end

  post "/send_message" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    params = URI.decode_query(body)
    topic = params["topic"] || "default"
    message = params["message"] || "Hello"
    id = params["id"] || "1"

    Phoenix.PubSub.broadcast(Ssepubsub.PubSub, topic, {:msg, message})
    send_resp(conn, 200, "Message sent")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
