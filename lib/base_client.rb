require 'net/http'
require 'uri'
require 'json'

class BaseClient
  def get(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response uri
    response_body = JSON.parse(response.body)
    if response_body.is_a? Array
      return response_body
    elsif response_body.key?("message")
      raise Exception.new response_body["message"]
    else
      raise Exception.new "Unknown error"
    end
  rescue Timeout::Error => e
    puts "Request timed out"
  rescue Exception => e
    puts "Request failed with #{e.message}"
  end
end
