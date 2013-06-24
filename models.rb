require 'rubygems'
require 'dm-core'

DataMapper.setup(:default, ENV['DATABASE_URL'])

class User
  include DataMapper::Resource
  property :id, Serial
  property :token, String
  DataMapper.finalize
end

class Bookmark
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, String
  property :added, Boolean
  DataMapper.finalize
end

