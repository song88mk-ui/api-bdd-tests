Then('I will have an operator token') do
  if last_response.headers['Content-Type'] =~ /json/
    json = JSON.parse(last_response.body)
    $operator_token = json['result']['operatorToken']
    if json['result'] && json['result']['accessToken']
      $access_token = json['result']['accessToken']
    end
  else
    puts "cannot obtain the operator token from response"
  end
end

When('I add the operator token') do
  header 'x-operator-token', $operator_token
end

When('I add the access token') do
  header 'Authorization', "Bearer " + $access_token
end


Then('show me the operator token') do
  puts "Operator Token = " + $operator_token
end

Then('show me the access token') do
  puts "Operator Token = " + $access_token
end
