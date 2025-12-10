Before('@betting') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_BETTING_API']
end

Before('@sportsbook') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_SPORTSBOOK_API']
end

Before('@wallet') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_WALLET_API']
end

Before('@platform') do
  ENV['SERVICE_URL'] = ENV['PLATFORM_INTERNAL_API']
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

# login and get an operator token
Before('@requires_operator_token') do
  header 'x-api-key', ENV['PLATFORM_API_KEY']
  header 'x-client-id', ENV['TEST_CLIENT_ID']
  header 'accept', 'application/json'
  header 'content-type', 'application/json'
  payload = {
    UserName: ENV['TEST_USER_NAME'],
    Password: ENV['TEST_USER_PASSWORD']
  }
  input = StringIO.new(JSON.generate(payload))

  request_opts = {method: 'post'}
  request_opts[:input] = input

  request "/v1/authentication/login", request_opts
  expect(last_response.status).to eq(200),
    "Unable to login: #{last_response.status} #{last_response.body}"

  response = JSON.parse(last_response.body)
  results = JsonPath.new("$.statusCode").on(response).to_a.map(&:to_s)
  expect(results).not_to be_empty

  results = JsonPath.new("$.message").on(response).to_a.map(&:to_s)
  expect(results).to include("Success")
  @operator_token = response['result']['operatorToken']
  header 'x-operator-token', @operator_token
end

After('@requires_operator_token') do
  if @operator_token.nil?
    return
  end
  header 'x-api-key', ENV['PLATFORM_API_KEY']
  header 'x-client-id', ENV['TEST_CLIENT_ID']
  header 'x-operator-token', @operator_token
  header 'accept', 'application/json'

  request_opts = {method: 'post'}
  request "/v1/authentication/logout", request_opts
  expect(last_response.status).to eq(200)

  response = JSON.parse(last_response.body)
  results = JsonPath.new("$.statusCode").on(response).to_a.map(&:to_s)
  expect(results).not_to be_empty

  results = JsonPath.new("$.message").on(response).to_a.map(&:to_s)
  expect(results).to include("Success")
  @operator_token = nil
end
