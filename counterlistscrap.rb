#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'watir'
File.open("counters.txt",'w') do |c|
	
$HIDE_BROWSER = true
browser = Watir::Browser.new
url = "http://dotabuff.com/heroes/pudge"
browser.goto url
page = Nokogiri::HTML.parse(browser.html)

	counters=[]
	0.upto(4) do |x|
		puts "Searching.."
		temp = page.css("#hero-versus section")[1]
		counters[x] = temp.css(".hero-link")[x].text
		c.write(counters[x] + "\n")
	end

	puts counters	
end





# heroes=[]
	# File.open("heroes.txt",'r') do |h|
	# 	while (line=h.gets)
	# 		heroes<<[line.chomp,h.gets]
	# 	end
	# end

	# 0.upto(9) do |i|
		# url = "http://dotabuff.com/heroes/#{heroes[i]}"


# header = page.at_css('.content-header-title')
# puts header.class
# puts header

# actual_header = header.css('h1')
# puts actual_header

# puts '-----'

# puts actual_header.text
# puts header.css('h1').first.text 


# hero_versus = page.at_css('#hero-versus')
# puts hero_versus.class
# puts hero_versus.inspect
# puts hero_versus.children.inspect