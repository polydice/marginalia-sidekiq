require "marginalia/sidekiq/version"
require "sidekiq"
require "marginalia"

class SidekiqMarginaliaIntegeration
  def call(worker, _msg, _queue)
    Marginalia::Comment.update_job!(worker)
    yield
  ensure
    Marginalia::Comment.clear_job!
  end
end


Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add(::SidekiqMarginaliaIntegeration)
  end
end
