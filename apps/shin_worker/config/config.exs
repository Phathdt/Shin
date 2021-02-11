use Mix.Config

config :verk,
  queues: [default: 25, priority: 10],
  max_retry_count: 10,
  max_dead_jobs: 100,
  poll_interval: 5000,
  start_job_log_level: :info,
  done_job_log_level: :info,
  fail_job_log_level: :info,
  generate_node_id: true,
  redis_url: {:system, "REDIS_URL"}

import_config "#{Mix.env()}.exs"
