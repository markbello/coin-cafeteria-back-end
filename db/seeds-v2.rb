#This seeds file downloads all the remote logos for our first 100 coins

require 'open-uri'

image_base_url = "https://www.cryptocompare.com"

urls = []

def download_image(url, dest)
  open(url) do |u|
    File.open(dest, 'wb') { |f| f.write(u.read) }
  end
end

Coin.all.each do |coin|
  url = image_base_url + coin[:image_url].to_s
  urls << url
end

urls.each do |url|
  puts "Downloadin #{url}"
  download_image(url, url.split('/').last)
end
