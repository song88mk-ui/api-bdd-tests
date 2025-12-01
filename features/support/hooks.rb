Before('@betting') do
  ENV['HOST']  = "localhost:3000"
end

Before('@sportsbook') do
  ENV['HOST']  = "localhost:3001"
end

Before('@wallet') do
  ENV['HOST']  = "localhost:3002"
end

Before('@platform') do
  ENV['HOST']  = "localhost:3004"
end

Before('@platformapi') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_PUBLIC_API']
end

After do
  ENV['HOST']  = ""
end
