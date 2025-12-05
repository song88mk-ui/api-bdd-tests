require 'slack-ruby-client'
require 'dotenv/load'


class Report
  def self.submit(report_name, file_name, channel_id = "C0A276YQB1P")
    puts "Submitting results to Slack!"

    if !ENV['SLACK_API_TOKEN']
      puts "Missing ENV[SLACK_API_TOKEN]!!!, aborting"
      return
    end


		Slack.configure do |config|
			config.token = ENV['SLACK_API_TOKEN']
			'Missing ENV[SLACK_API_TOKEN]!' unless config.token
		end

		client = Slack::Web::Client.new

		auth = client.auth_test #pragma: allowlist secret
		puts "Connected to team #{auth.team} (#{auth.team_id}) as #{auth.user}."

    begin
      client.chat_postMessage(
        channel: channel_id,
        text: "Here is the latest result on *#{report_name}* - Cucumber Tests!",
        as_user: true)

      client.chat_postMessage(
        channel: channel_id,
        text: "Report submitted on #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}. " +
              "Click the uploaded file and open it",
        as_user: true)

      file_content = File.read(file_name)

      result = client.files_upload_v2(
        channel_id: channel_id,
        filename: file_name,
        content: file_content,
        title: report_name)

      puts "Report URL: #{result.files.first.permalink_public}"
    rescue Slack::Web::Api::Errors::SlackError => e
      puts e
      puts "Error submitting report"
    rescue => e
      puts e
      puts "Unknown error"
    end


  end
end



#puts client.files_upload_v2(
  #filename: 'files_upload_v2.txt',
  #content: SecureRandom.hex
#).files.first.permalink_public

#puts client.files_upload_v2(
  #filename: 'files_upload_v2_to_general_channel.txt',
  #content: SecureRandom.hex,
  #channel: '#general'
#).files.first.permalink_public

#puts client.files_upload_v2(
  #filename: 'files_upload_v2_to_general_and_random_channels.txt',
  #content: SecureRandom.hex,
  #channels: ['#general', '#random']
#).files.first.permalink_public

#channel_id = client.conversations_id(channel: '#general')['channel']['id']
#puts client.files_upload_v2(
  #filename: 'files_upload_v2_to_general_by_id.txt',
  #content: SecureRandom.hex,
  #channel_id: channel_id
#).files.first.permalink_public

#client.files_upload_v2(
  #files: [
    #{ filename: 'files_upload_v2_to_general_first_file.txt', content: SecureRandom.hex },
    #{ filename: 'files_upload_v2_to_general_second_file.txt', content: SecureRandom.hex }
  #],
  #channels: ['#general']
#).files.each { |file| puts file.permalink_public }
