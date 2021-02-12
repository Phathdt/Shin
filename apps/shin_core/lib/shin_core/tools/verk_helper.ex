defmodule ShinCore.VerkHelpers do
  def enqueue(job) do
    Verk.enqueue(job, :redix_api)
  end

  def enqueue(queue, worker, args, opts \\ []) do
    enqueue(struct(%Verk.Job{queue: queue, class: worker, args: args}, opts))
  end
end
