require 'net/https'
require 'uri'
require 'rubygems'
require 'json'
require './models.rb'

# httpリクエストを行う
def https_request(url, data)
  response = nil
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  http.verify_depth = 5
  http.start {
    #request instance
    request = Net::HTTP::Post.new(url.path)
    #header
    request['Content-Type'] = 'application/json; charset=UTF-8'
    request['X-Accept'] = 'application/json'
    #body
    request.set_form_data(data, "&")
    response = http.request(request)
  }
  response
end

# Pocketに記事を追加
def add(atoken, target_url)
  url = URI.parse('https://getpocket.com/v3/add')
  data = {
    :consumer_key => '12545-b27b4b1d15d45394ffc1980b',
    :access_token => atoken,
    :url => target_url
  }
  response = https_request url, data
  JSON.parse(response.body)
end
