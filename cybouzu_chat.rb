# -*- coding: utf-8 -*-
#require "open-uri"
require "rubygems"
require "nokogiri"

url = "./temp.html" 

html = open(url) do |f|
  f.read
end

doc = Nokogiri::HTML.parse(html)
p doc.title
unreads = doc.xpath('//div[@class="commentItem unread"]')
p unreads.methods

unreads.each do |unread|
 timestamp=unread.css('div>div>div>span.commentDate').text
 number=unread.css('div>div>div>span.number').text
 menber=unread.css('div>div>div>span.member').text.gsub(/\s+/,"")
 body=unread.css('div>div>div>div.formatContentsView').text

puts  number+menber+" "+timestamp
puts "[\n"+body+"\n]"
end

