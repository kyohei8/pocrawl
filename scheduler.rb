require './helper.rb'
# はてなブックマークから30件をPocketに入れる
# 30(件) * 6(time/hour) * 24(h) = 4320 (件/1日)
rss = RSS::Parser.parse('http://b.hatena.ne.jp/hotentry?mode=rss')
rss.items.each do |item|
  add item.link
  sleep(5)
end