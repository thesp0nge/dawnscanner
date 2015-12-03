# It will be completely rewritten in dawnscanner v2.0.0
#
# require 'anemone'
# require 'httpclient'

# h=HTTPClient.new()
# Anemone.crawl(ARGV[0]) do |anemone|
  # anemone.on_every_page do |page|
      # response = h.get(page.url)
      # puts "Original: #{page.url}: #{response.code}"
      # response = h.get(page.url.to_s.split(";")[0].concat(".bak"))
      # puts "BAK: #{page.url.to_s.split(";")[0].concat(".bak")}: #{response.code}"
      # response = h.get(page.url.to_s.split(";")[0].concat(".old"))
      # puts "OLD: #{page.url.to_s.split(";")[0].concat(".old")}: #{response.code}"
      # response = h.get(page.url.to_s.split(";")[0].concat("~"))
      # puts "~: #{page.url.to_s.split(";")[0].concat("~")}: #{response.code}"
  # end
# end
