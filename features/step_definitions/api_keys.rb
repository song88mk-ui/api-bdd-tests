

Given('I have platform internal api key') do
  header 'x-api-key', ENV['PLATFORM_API_INTERNAL_KEY']
end

Given('I have platform API Key') do
  header 'x-api-key', ENV['PLATFORM_API_KEY']
end

Given('I have oddsfeed API Key') do
  header 'x-api-key', ENV['ODDSFEED_API_KEY']
end

Given('I have auth API Key') do
  header 'x-api-key', ENV['AUTH_API_KEY']
end
