import Config

config :sse_example, Ssepubsub.Application,
  node_name: System.get_env("NODE_NAME") ,
  cookie: :"#{System.get_env("COOKIE")}"

nodes = (System.get_env("NODES") || "defaul@127.0.0.1")
          |> String.split(",")
          |> Enum.map(&String.to_atom/1)

config :libcluster,
topologies: [
  example_cluster: [
    strategy: Cluster.Strategy.Epmd,
    config: nodes
  ]
]

config :sse_example,
  port: String.to_integer(System.get_env("PORT") || "4000")
