Before('@betting') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_BETTING_API'] || 'http://localhost:3003'
end

Before('@sportsbook') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_SPORTSBOOK_API'] || 'http://localhost:3002'
end

Before('@wallet') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_WALLET_API'] || 'http://localhost:3001'
end

Before('@platform') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_API'] || 'http://localhost:3000'
end

Before('@platformapi') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_PUBLIC_API']
end

Before('@oddsfeed-client-api') do
  ENV['SERVICE_URL'] = ENV['ODDSFEED_CLIENT_API']
end

Before('@oddsfeed-client-platform-api') do
  ENV['SERVICE_URL'] = ENV['ODDSFEED_CLIENT_PLATFORM_API']
end

Before('@operator-api') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_OPERATOR_API']
end

Before('@auth-api') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_AUTH_API']
end

After do
  ENV['SERVICE_URL']  = ""
end
