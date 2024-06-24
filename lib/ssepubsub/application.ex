defmodule Ssepubsub.Application do
  use Application

  def start(_type, _args) do
    configure_node()

    topologies = Application.get_env(:libcluster, :topologies)

    children = [
      {Cluster.Supervisor, [topologies, [name: Ssepubsub.ClusterSupervisor]]},
      {Phoenix.PubSub, name: Ssepubsub.PubSub},
      {Plug.Cowboy, scheme: :http, plug: Ssepubsub.Router, options: [
        port: Application.get_env(:sse_pub_sub_cluster, :port),
        protocol_options: [
          idle_timeout: :infinity,
          inactivity_timeout: :infinity,
          linger_timeout: :infinity
        ]
      ]}
    ]

    opts = [strategy: :one_for_one, name: Ssepubsub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp configure_node do
    node_name = Application.get_env(:sse_pub_sub_cluster, __MODULE__)[:node_name]
    cookie = Application.get_env(:sse_pub_sub_cluster, __MODULE__)[:cookie]

    Node.start(:"#{node_name}", :shortnames)
    Node.set_cookie(cookie)
  end
end
