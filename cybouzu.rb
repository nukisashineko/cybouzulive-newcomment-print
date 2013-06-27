#!/usr/bin/ruby 
# -*- coding : utf-8 -*-

 require 'mechanize'
  
  cybozulive_user,cybozulive_pass=File.readlines("passwd.txt").map{|l| l.gsub(/.*:/,"").chomp}
  toppage="https://cybozulive.com/login"
  
   agent = Mechanize.new
   agent.ssl_version = 'TLSv1'
   login_page = agent.get("https://cybozulive.com/login")
 

  
   login_form = login_page.forms.first
   login_form['loginMailAddress'] = cybozulive_user
   login_form['password'] = cybozulive_pass
   redirect_page = agent.submit(login_form)
   redirect_page.root.css('//div#cba_portalDashboardIconParts>div.list>div.groupwareList>div.tile>div.logo>a').each do |group_page|
    sl_page=redirect_page.link_with(:href=>group_page.attributes["href"].text).click

  sl_page.root.css('//tr.subjectLine>td>div>a').each do |url|
    comments=sl_page.link_with(:href=>url.attributes["href"].text).click
  puts comments.title
   unreads=(comments/'div[@class="commentItem unread"]')
  unreads.each do |unread|
   timestamp=unread.css('div>div>div>span.commentDate').text
   number=unread.css('div>div>div>span.number').text
   menber=unread.css('div>div>div>span.member').text.gsub(/\s+/,"")
   body=unread.css('div>div>div>div.formatContentsView').text

  puts  number+menber+" "+timestamp
  puts "[\n"+body+"\n]"
end
end
end

