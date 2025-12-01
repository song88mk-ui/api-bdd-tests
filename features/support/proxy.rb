require 'rack/proxy'

class Proxy < Rack::Proxy
  def perform_request(env)
    env['HTTP_HOST'] = ENV['HOST']
    super(env)
  end
end
