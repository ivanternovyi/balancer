class ComputeFactorizationJob < ActiveJob::Base
  queue_as :default

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return unless task

    task.compute_factorization
  end
end
