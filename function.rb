#Bundling a gem from github requires more paths to be added to the $LOAD_PATH
#This workaround is not normally required
Dir.glob(File.expand_path('vendor/bundle/ruby/*/bundler/gems/*/lib', __dir__ )) do |path|
  $LOAD_PATH << path
end

require 'aws-sdk-dynamodb'
require 'net/http/persistent'
require 'aws-xray-sdk/lambda'


def http_connection
  @http ||= Net::HTTP::Persistent.new name: 'myhttp'
end

def dynamo_client
  @dynamo_client ||= Aws::DynamoDB::Client.new
end

def handler(event:,context:)
  puts dynamo_client.list_tables
  uri = URI 'https://ip-ranges.amazonaws.com/ip-ranges.json'
  puts http_connection.request(uri).body
end
