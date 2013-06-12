#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'open-uri'
require 'nokogiri'

File.open("heros.txt",'w') do |f|

	url = "http://dotabuff.com/heroes/played?date=month"
	page = Nokogiri::HTML(open(url))
	hero = page.css(".hero-link")

	0.upto(10)
		f.write(hero + "\n")
	end
end

