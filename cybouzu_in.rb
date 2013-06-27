#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-

 require 'mechanize'
 require 'kconv' #あとでUTF-8を扱うので
  
  cybozulive_user,cybozulive_pass = File.readlines("passwd.txt").map{|l| l.gsub(/.*:/,"").chomp}

  toppage="https://cybozulive.com/login"
  
   agent = Mechanize.new
   agent.ssl_version = 'TLSv1'
   login_page = agent.get("https://cybozulive.com/login")
   login_link = diary_page.link_with(:text=>"ログイン")
 

 
   login_form = login_page.forms.first
   login_form['loginMailAddress'] = cybozulive_user
   login_form['password'] = cybozulive_pass
   login_form
p   redirect_page = agent.submit(login_form)
