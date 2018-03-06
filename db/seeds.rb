#API instances
newsapi = News.new("a53d6eac7ce54178bd0bcb9fd820d75c")

watson = WatsonAPIClient::NaturalLanguageUnderstanding.new(user: 'b147c8bc-0bf4-434a-8939-4d5b2652f8a7', 'password': '6HslRoMb6XFt',
      'version_date': '2017-02-27')



#Seed coins

top100_raw = open("https://api.coinmarketcap.com/v1/ticker/").read
top100= JSON.parse(top100_raw)

top100.each do |coin|
  newCoin = Coin.find_or_create_by(symbol: coin["symbol"])
  newCoin.coin_market_cap_id = coin["id"]
  newCoin.name = coin["name"]
  newCoin.symbol = coin["symbol"]
  newCoin.rank = coin["rank"]
  newCoin.price_usd= coin["price_usd"]
  newCoin.price_btc= coin["price_btc"]
  newCoin.volume_usd= coin["24h_volume_usd"]
  newCoin.market_cap_usd= coin["market_cap_usd"]
  newCoin.available_supply= coin["available_supply"]
  newCoin.total_supply= coin["total_supply"]
  newCoin.max_supply= coin["max_supply"]
  newCoin.percent_change_1h= coin["percent_change_1h"]
  newCoin.percent_change_24h= coin["percent_change_24h"]
  newCoin.percent_change_7d= coin["percent_change_7d"]
  newCoin.last_updated= coin["last_updated"]
  puts coin["last_updated"]
  newCoin.save
  puts newCoin
  # puts JSON.parse(coin)
end

# #Get news articles for a coin
# all_articles = newsapi.get_everything(q: 'bitcoin AND btc',
#                                       from: '2017-02-14',
#                                       language: 'en',
#                                       sortBy: 'popularity',
#                                       page: 1)
#
# #Create article records
# all_articles.each do |article|
#   puts article.author
#   new_article = NewsArticle.new(coin_id: 1)
#   puts new_article
#   new_article.author = article.author
#   puts new_article.author
#   new_article.description = article.description
#   puts new_article.description
#   new_article.date = article.publishedAt
#   puts new_article.date
#   new_article.title = article.title
#   puts new_article.title
#   new_article.url = article.url
#
#   #Analyze article content with Watson
#   watson_data_res = watson.analyzeGet(url: article.url, version: '2017-02-27', features: 'sentiment')
#   watson_data = JSON.parse(watson_data_res)
#   new_article.score = watson_data["sentiment"]["document"]["score"]
#   new_article.sentiment = watson_data["sentiment"]["document"]["label"]
#
#   new_article.save
# end
