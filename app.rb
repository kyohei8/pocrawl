require 'sinatra'
require 'rss'

get '/' do
  rss = RSS::Parser.parse('http://b.hatena.ne.jp/hotentry?mode=rss')
  rss.items.each do |item|
    puts '=============='
    p item
    #p item.link, description, conten endoded?
    puts '=============='
  end
  'a'
end