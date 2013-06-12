#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'open-uri'
require 'nokogiri'

File.open("heros.txt",'w') do |f|
	url = "http://dotabuff.com/heroes/played?date=month"
	page = Nokogiri::HTML(open(url))
	hero=[]
	0.upto(9) do |x|
		hero[x] = page.css(".hero-link")[x].text
		f.write(hero[x] + "\n")
	end

	puts hero
end

