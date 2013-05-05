require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require './models.rb'

class Database
  def connect
    #DataMapperはmodel.rbで定義
    self
  end

  def migrate
    #全モデルクラスに対しマイグレーション、テーブル内のデータは破棄する。
    DataMapper.auto_migrate!
    self
  end

end
