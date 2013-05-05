require 'rubygems'
require 'dm-core'

DataMapper.setup(:default, "sqlite3:///Users/kyohei/Dropbox/private/workspace/pocroll/pocroll.db" || ENV['DATABASE_URL'] || 'postgres://x:x@ec2-54-235-155-40.compute-1.amazonaws.com:5432/de70p0tjphkljg')
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

