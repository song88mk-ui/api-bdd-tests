

Given('I have internal api key') do
  header 'x-api-key', ENV['PLATFORM_API_INTERNAL_KEY']
end

Given('I have an API Key') do
  header 'x-api-key', ENV['PLATFORM_API_KEY']
end
