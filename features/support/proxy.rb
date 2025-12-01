require 'rack/proxy'

class Proxy < Rack::Proxy
  def perform_request(env)
    env['HTTP_HOST'] = ENV['HOST']
    if !(ENV['HOST'] =~ /localhost/) # use https for non localhost
      env['rack.url_scheme'] = 'https'
      env['HTTPS'] = true
    end
    super(env)
  end
end
