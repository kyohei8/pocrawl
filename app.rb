# coding: utf-8
require 'sinatra'
require 'rss'
require 'dm-core'
require './models.rb'
require 'net/https'
require 'uri'
require 'rubygems'
require 'json'
require './helper.rb'

enable :sessions

helpers do
  def root_url
    request.url.match(/(^.*\/{2}[^\/]*)/)[1]
  end
end

CONSUMER_KEY = '12545-b27b4b1d15d45394ffc1980b' #TODO
BASE_URL = 'https://getpocket.com'
OPTION_URL = {
  :request_path => '/v3/oauth/request',
  :authorize_path => '/v3/oauth/authorize',
  :user_auth_path => '/auth/authorize',
  :get_url => '/v3/get',
  :add_url => '/v3/add',
  :mod_url => '/v3/send'
}


get '/' do
  url = URI.parse('https://getpocket.com/v3/get')
  user = User.first()
  if user.nil?
    raise 'err: User not found'
  end
  data = {
    :consumer_key => '12545-b27b4b1d15d45394ffc1980b',
    :access_token => user.token,
  }
  response = https_request url, data
  res = JSON.parse(response.body)
  "登録件数：#{res['list'].size}件"
end

# pocketの認証を行う
get '/auth' do
  url = URI.parse(BASE_URL + OPTION_URL[:request_path])
  data = {:consumer_key => CONSUMER_KEY, :redirect_uri => "#{root_url}/Pocket/index"}
  response = https_request url, data
  token = JSON.parse(response.body)['code']
  session[:request_token] = token
  redirect "#{BASE_URL}#{OPTION_URL[:user_auth_path]}?request_token=#{token}&redirect_uri=#{root_url}/get_access_token"
end

get '/get_access_token' do
  url = URI.parse(BASE_URL + OPTION_URL[:authorize_path])
  data = {:consumer_key => CONSUMER_KEY, :code => session[:request_token]}
  response = https_request url, data
  if response.code == 403
    puts '認証に失敗しました。'
    # todo エラーページへ
  end
  token = JSON.parse(response.body)['access_token']
  session[:request_token] = nil
  user = User.first()
  if user.nil?
    User.create(
      :token => token
    )
  end
  redirect '/'
end